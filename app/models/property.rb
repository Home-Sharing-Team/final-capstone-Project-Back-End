class Property < ApplicationRecord
  has_many :images, class_name: 'PropertyImage', dependent: :destroy
  has_many :property_categories, dependent: :destroy
  has_many :categories, through: :property_categories

  has_many :reservations, dependent: :destroy
  has_many :blocked_periods, dependent: :destroy
  has_one :min_cycle_hosting, class_name: 'Hosting', dependent: :destroy
  has_many :hostings, dependent: :destroy

  belongs_to :address
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :guest_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :bedrooms, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :beds, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :baths, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :kind, presence: true
  enum kind: %i[apartment house]
  validates :size, presence: true, numericality: { greater_than_or_equal_to: 1 }

  def set_min_cycle_hosting
    hostings_hash = hostings.reduce({}) do |acc, hosting|
      { **acc, hosting[:cycle] => hosting }
    end

    self.min_cycle_hosting_id = if hostings_hash['night']
                                  hostings_hash['night'].id
                                elsif hostings_hash['week']
                                  hostings_hash['week'].id
                                elsif hostings_hash['month']
                                  hostings_hash['month'].id
                                end

    Hosting.find(min_cycle_hosting_id)

    save
  rescue ActiveRecord::RecordNotFound
    self.min_cycle_hosting_id = nil
    save
  end

  def set_min_hosting_to_nil
    self.min_cycle_hosting_id = nil

    save
  end
end
