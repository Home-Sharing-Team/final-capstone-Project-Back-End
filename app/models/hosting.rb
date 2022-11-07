class Hosting < ApplicationRecord
  belongs_to :user
  belongs_to :property
  has_many :reservations, dependent: :destroy

  validates :cycle, presence: true
  validates :minumum_cycle_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :cleaning_fee, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :public, presence: true
end
