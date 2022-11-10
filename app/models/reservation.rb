class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hosting
  #validates :guests, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  #validates :check_in, presence: true, availability: true
  #validates :check_out, presence: true, availability: true
validate :check_out_after_check_in
validate :check_in_smaller_than_today
validate :check_minimum_cycle
validate :check_blocked_periods

  private

def check_minimum_cycle

  number_of_days = check_out - check_in
  hosting = Hosting.find([hosting_id])

   minimum_cycle_amount = hosting.minimum_cycle_amount
   cycle = hosting.cycle

  # minimum_cycle_amount = 2
  # cycle = 1
  if cycle == 0
    errors.add("Sorry, the minimum number of days to rent this property must be ", 1 * minimum_cycle_amount) if number_of_days < 1 * minimum_cycle_amount
  elsif cycle == 1
    errors.add("Sorry, the minimum number of days to rent this property must be ", 7 * minimum_cycle_amount) if number_of_days < 7 * minimum_cycle_amount
  elsif cycle == 2
    errors.add("Sorry, the minimum number of days to rent this property must be ", 30 * minimum_cycle_amount) if number_of_days < 30 * minimum_cycle_amount
  end
end

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
  hosting = Hosting.find([hosting_id])

  #@blocked_periods = hosting.properties_id.blocked_periods.all

  @blocked_periods = [BlockedPeriod.find_by_id(1), BlockedPeriod.find_by_id(2)]

  @blocked_periods.each do |block|
    if !(check_in > block.end_date || check_out < block.start_date)
    errors.add(:check_in, 'Sorry, the property is not available for your dates')
    return
  end
end

end

