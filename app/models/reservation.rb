class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hosting

  validates :guests, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :check_in, presence: true, availability: true
  validates :check_out, presence: true, availability: true

  validate :check_out_after_check_in

  private

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?

    if check_out < check_in
      errors.add(:check_out, "must be after the start date")
    end
  end
end
