class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hosting
  belongs_to :property

  validate :check_out_after_check_in
  validate :check_in_smaller_than_today
  validate :check_minimum_cycle
  validate :check_hosting_belongs_to_property

  private

  def check_hosting_belongs_to_property
    hosting = Hosting.find(hosting_id)

    return unless hosting[:property_id] != property_id

    errors.add(:hosting_id,
               'hosting_id must belong to the property_id provided.')
  end

  # rubocop:disable Metrics/MethodLength
  def check_minimum_cycle
    number_of_days = check_out - check_in
    hosting = Hosting.find(hosting_id)
    min_cycle_amount = hosting[:minimum_cycle_amount]
    cycle = hosting[:cycle]

    case cycle
    when 'day'
      if number_of_days < 1 * min_cycle_amount
        errors.add('Sorry, the minimum number of days to rent this property must be ',
                   1 * min_cycle_amount)
      end
    when 'week'
      if number_of_days < 7 * min_cycle_amount
        errors.add('Sorry, the minimum number of days to rent this property must be ',
                   7 * min_cycle_amount)
      end
    when 'month'
      if number_of_days < 30 * min_cycle_amount
        errors.add('Sorry, the minimum number of days to rent this property must be ',
                   30 * min_cycle_amount)
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?

    return unless check_out < check_in

    errors.add(:check_out, 'check_out must be after the check_in')
  end

  def check_in_smaller_than_today
    return if check_in.blank? || check_out.blank?

    return unless check_in < Date.today

    errors.add(:check_in, 'check_in must be after today')
  end
end
