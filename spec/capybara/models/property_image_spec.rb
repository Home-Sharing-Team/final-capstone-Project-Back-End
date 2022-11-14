require 'rails_helper'

RSpec.describe PropertyImage, type: :model do
  before do
    @property_image = PropertyImage.create(property_id: 20, source: 'https://images.unsplash.com/photo-1610078888889-1b1b1b1b1b1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
  end

  it 'is valid with valid attributes' do
    expect(@property_image).to be_valid
  end

  it 'is not valid without a property_id' do
    @property_image.property_id = nil
    expect(@property_image).to_not be_valid
  end

  it 'is not valid without a source' do
    @property_image.source = nil
    expect(@property_image).to_not be_valid
  end
end
