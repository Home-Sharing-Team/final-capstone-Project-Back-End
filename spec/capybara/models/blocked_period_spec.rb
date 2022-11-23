require 'rails_helper'

RSpec.describe 'blocked_periods', type: :model do
  before do
    @blocked_period = BlockedPeriod.create(start_date: '2023-02-01', end_date: '2023-02-03', property_id: 2)
  end

  it 'is not valid if end_date is before start_date' do
    @blocked_period.end_date = '2023-01-01'
    expect(@blocked_period).to_not be_valid
  end

  it 'is not valid if start_date is equal to today' do
    @blocked_period.start_date = Date.today
    expect(@blocked_period).to_not be_valid
  end

  it 'is not valid if start_date is before today' do
    @blocked_period.start_date = '2021-01-01'
    expect(@blocked_period).to_not be_valid
  end
end
