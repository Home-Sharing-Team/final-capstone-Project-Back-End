class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property

  before_save :set_reservation_price

  validate :check_out_after_check_in
  validate :check_in_smaller_than_today
  validate :check_minimum_cycle
  validate :check_guest_capacity

  private

  def set_reservation_price
    property = Property.find(property_id)
    num_nights = check_out - check_in
    selected_hosting = get_selected_hosting(
      property.min_cycle_hosting,
      property.hostings,
      num_nights
    )
    self.price = selected_hosting[:price_by_night] * num_nights
  end

  def get_selected_hosting_by_min_available_cycle(
    min_cycle,
    hostings_hash,
    num_nights
  )
    cycle_durations = {
      "night" => 1,
      "week" => 7,
      "month" => 30,
    }
    selected_hosting = hostings_hash[min_cycle]
  
    if cycle_durations[min_cycle] < cycle_durations["week"] && num_nights >= cycle_durations["week"] && num_nights < cycle_durations["month"] && hostings_hash["week"]
      selected_hosting = hostings_hash["week"]
    elsif cycle_durations[min_cycle] < cycle_durations["month"] && num_nights >= cycle_durations["month"] && hostings_hash["month"]
      selected_hosting = hostings_hash["month"]
    end
  
    price_by_night = selected_hosting.rate / cycle_durations[selected_hosting.cycle]
  
    {
      hosting: selected_hosting,
      price_by_night:,
    }
  end

  def get_selected_hosting(min_cycle_hosting, hostings, num_nights)
    hostings_hash = hostings.reduce({}) do |acc, hosting|
        { **acc, hosting[:cycle] => hosting }
    end
  
    if min_cycle_hosting 
      return get_selected_hosting_by_min_available_cycle(
        min_cycle_hosting.cycle,
        hostings_hash,
        num_nights
      )
    end
  
    return nil
  end

  # rubocop:disable Metrics/MethodLength
  def check_minimum_cycle
    cycle_durations = {
      "night" => 1,
      "week" => 7,
      "month" => 30,
    }
    num_nights = check_out - check_in

    return if num_nights == 0

    property = Property.find(property_id)
    selected_hosting = get_selected_hosting(
      property.min_cycle_hosting,
      property.hostings,
      num_nights
    )
    if selected_hosting
      selected_hosting = selected_hosting[:hosting]
      min_cycle_amount = selected_hosting[:minimum_cycle_amount]
      cycle = selected_hosting[:cycle]

      if num_nights < min_cycle_amount * cycle_durations[cycle]
        errors.add(:num_nights, "- the minimum number of nights to rent this property is #{min_cycle_amount * cycle_durations[cycle]}")
      end
    else
      errors.add(:error, '- no hosting could be selected.')
    end
  end
  # rubocop:enable Metrics/MethodLength

  def check_guest_capacity
    property = Property.find(property_id)
    errors.add(:guest_capacity, '- the number of guests exceeded the maximum allowed for this property.') if guests > property.guest_capacity
  end

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?

    return unless check_out <= check_in

    errors.add(:check_out, '- check out date must be after check in date')
  end

  def check_in_smaller_than_today
    return if check_in.blank? || check_out.blank?

    return unless check_in < Date.today

    errors.add(:check_in, '- check in date must be after today')
  end
end
