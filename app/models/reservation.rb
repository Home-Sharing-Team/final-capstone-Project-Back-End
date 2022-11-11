class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hosting
  # validates :guests, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  # validates :check_in, presence: true, availability: true
  # validates :check_out, presence: true, availability: true
  validate :check_out_after_check_in
  validate :check_in_smaller_than_today
  validate :check_minimum_cycle
  validate :check_blocked_periods

  private

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

def check_blocked_periods
  hosting = Hosting.find(hosting_id)
  property = Property.find(hosting.properties_id)
  @blocked_periods = property.blocked_periods

  @blocked_periods.each do |block|
    unless check_in > block.end_date || check_out < block.start_date
      errors.add(:check_in, 'Sorry, the property is not available for your dates')
      next
    end
  end
end
