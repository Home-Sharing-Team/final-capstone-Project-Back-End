class Category < ApplicationRecord
  # belongs_to :property_category
  # has_and_belongs_to_many :properties
  has_many :property_categories, dependent: :destroy
  has_many :properties, through: :property_categories

  validates :name, presence: true, uniqueness: true
end
