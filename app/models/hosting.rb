class Hosting < ApplicationRecord
  belongs_to :user
  belongs_to :property
  has_many :reservations, dependent: :destroy
  has_many :blocked_periods, dependent: :destroy

  validates :cycle, presence: true
  validates :minimum_cycle_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :cleaning_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :public, presence: true
  enum cycle: { day: 0, week: 1, month: 2 }

  # @minimum_cycle_amount = hosting.minimum_cycle_amount
  # @cycle = hosting.cycle
end
