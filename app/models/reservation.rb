class Reservation < ApplicationRecord
  belongs_to :user
  #belongs_to :hosting
  #validates :guests, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  #validates :check_in, presence: true, availability: true
  #validates :check_out, presence: true, availability: true
validate :check_out_after_check_in
validate :check_in_smaller_than_today
validate :check_minimum_cycle


def check_minimum_cycle
  @hosting = Hosting.find(params[:id])
  @minimum_cycle_amount = @hosting.minimum_cycle_amount
  @hosting.cycle
  if cycle == 0
    errors.add("check_in must be at least 1 day") if number_of_days < 1* minimum_cycle_amount
  elsif cycle == 1
    errors.add("check_in must be at least 7 days") if number_of_days < 7* minimum_cycle_amount
  elsif cycle == 2
    errors.add("check_in must be at least 30 days") if number_of_days < 30* minimum_cycle_amount
  end
end

  private

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









def check_medium_cycle
  number_of_weeks = (check_out - check_in).to_i / 7
  if cycle == 1
    return unless number_of_weeks < hosting.minimum_cycle_amount
    return if number_of_weeks >= hosting.minimum_cycle_amount

    errors.add(:check_out, 'Cannot book less than minimum cycle amount')

  end
end

def check_long_cycle
  number_of_months = (check_out - check_in).to_i / 30
  if cycle == 2
    return unless number_of_months < hosting.minimum_cycle_amount 
    return if number_of_months >= hosting.minimum_cycle_amount

    errors.add(:check_out, 'Cannot book less than minimum cycle amount')
  end
end








