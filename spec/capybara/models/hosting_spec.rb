require 'rails_helper'

RSpec.describe Hosting, type: :model do
  before do
    @hosting = Hosting.create(cycle: 1, minimum_cycle_amount: 1, rate: 1, cleaning_fee: 1,
                              user_id: 2, property_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(@hosting).to be_valid
  end

  it 'is not valid without a cycle' do
    @hosting.cycle = nil
    expect(@hosting).to_not be_valid
  end

  it 'is not valid without a minimum_cycle_amount' do
    @hosting.minimum_cycle_amount = nil
    expect(@hosting).to_not be_valid
  end

  it 'is not valid without a rate' do
    @hosting.rate = nil
    expect(@hosting).to_not be_valid
  end

  it 'is not valid without a cleaning_fee' do
    @hosting.cleaning_fee = nil
    expect(@hosting).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @hosting.user_id = nil
    expect(@hosting).to_not be_valid
  end

  it 'is not valid without a property_id' do
    @hosting.property_id = nil
    expect(@hosting).to_not be_valid
  end
end
