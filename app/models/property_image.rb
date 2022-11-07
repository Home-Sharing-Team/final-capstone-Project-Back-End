class PropertyImage < ApplicationRecord
	belongs_to :property
  validates :source, presence: true
end
