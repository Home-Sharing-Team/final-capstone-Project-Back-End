class Hosting < ApplicationRecord
  belongs_to :user
  belongs_to :property

  enum cycle: %i[night week month]
  after_initialize :set_default_cycle, if: :new_record?

  after_save :set_property_min_hosting
  before_destroy :set_property_min_hosting_to_nil
  after_destroy :set_property_min_hosting

  validates :cycle, presence: true
  validates :minimum_cycle_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :cleaning_fee, numericality: { greater_than_or_equal_to: 0 }

  private

  def set_property_min_hosting
    property.set_min_cycle_hosting
  end

  def set_default_cycle
    self.cycle ||= :night
  end

  def set_property_min_hosting_to_nil
    property.set_min_hosting_to_nil
  end
end
