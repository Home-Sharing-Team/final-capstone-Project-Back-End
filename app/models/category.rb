class Category < ApplicationRecord
  #belongs_to :property_category
  validates :name, presence: true, :uniqueness => true
  has_and_belongs_to_many :properties
end
