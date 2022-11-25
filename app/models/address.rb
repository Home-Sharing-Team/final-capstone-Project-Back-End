class Address < ApplicationRecord
  has_one :property
  validates :street, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
