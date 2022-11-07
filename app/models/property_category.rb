class PropertyCategory < ApplicationRecord
  has_many :categories, dependent: :destroy
  belongs_to :property
end
