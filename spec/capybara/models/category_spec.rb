require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = Category.create(name: 'Tundra')
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid if name is not unique' do
    @category2 = Category.create(name: 'Tundra')
    expect(@category2).to_not be_valid
  end
end
