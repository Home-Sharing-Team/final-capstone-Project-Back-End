require 'rails_helper'

RSpec.describe BlockedPeriod, type: :model do
  before do
    @blocked_period = BlockedPeriod.create(start_date: '2022-11-12', end_date: '2022-11-25', property_id: 17)
  end

  it 'is valid with valid attributes' do
    expect(@blocked_period).to be_valid
  end

  it 'is not valid without a start_date' do
    @blocked_period.start_date = nil
    expect(@blocked_period).to_not be_valid
  end

  it 'is not valid without a end_date' do
    @blocked_period.end_date = nil
    expect(@blocked_period).to_not be_valid
  end

  it 'is not valid without a property_id' do
    @blocked_period.property_id = nil
    expect(@blocked_period).to_not be_valid
  end
end
