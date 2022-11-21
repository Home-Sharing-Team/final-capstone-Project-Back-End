class BlockedPeriod < ApplicationRecord
  belongs_to :property
  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :end_date_after_start_date
  validate :start_date_greater_than_today
  validate :check_blocked_periods_conflicts

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    return unless end_date < start_date

    errors.add(:end_date, 'must be after the start date')
  end

  def start_date_greater_than_today
    return if start_date.blank?

    return unless start_date < Date.today

    errors.add(:start_date, 'must be after today')
  end

  def check_blocked_periods_conflicts
    property = Property.find(property_id)
    p property
    @blocked_periods = property.blocked_periods

    @blocked_periods.each do |block|
      unless start_date > block.end_date || end_date < block.start_date
        errors.add(:start_date, 'Sorry, the property is not available for your dates')
        next
      end
    end
  end
end
