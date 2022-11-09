class PropertyCategory < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories
  belongs_to :property
end
