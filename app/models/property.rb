class Property < ApplicationRecord
  has_many :images, class_name: 'PropertyImage', dependent: :destroy
  has_many :property_categories, dependent: :destroy
  has_many :categories, through: :property_categories
  has_many :blocked_periods, dependent: :destroy
  has_many :hostings, dependent: :destroy
  has_one :min_cycle_hosting, class_name: 'Hosting', dependent: :destroy
  belongs_to :address
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :guest_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :bedrooms, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :beds, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :bathrooms, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :kind, presence: true
  enum kind: %i[apartment house]
  validates :size, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def set_min_cycle_hosting
    hostings_hash = self.hostings.reduce(Hash.new) do |acc, hosting|
      { **acc, hosting[:cycle] => hosting }
    end

    if hostings_hash["night"] 
      self.min_cycle_hosting_id = hostings_hash["night"].id
    elsif hostings_hash["week"] 
      self.min_cycle_hosting_id = hostings_hash["week"].id
    elsif hostings_hash["month"] 
      self.min_cycle_hosting_id = hostings_hash["month"].id
    else
      self.min_cycle_hosting_id = nil
    end

    self.save
  end
end
