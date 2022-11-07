class Address < ApplicationRecord
	belongs_to :property
  validates :street, presence: true
	validates :city, presence: true
	validates :country, presence: true
end
