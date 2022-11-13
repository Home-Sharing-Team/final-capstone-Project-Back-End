require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @reservation = Reservation.create(check_in: '2022-11-12', check_out: '2022-11-28', guests: 1, user_id: 3,
                                      hosting_id: 3, price: '150')
  end

  it 'is valid with valid attributes' do
    expect(@reservation).to be_valid
  end

  it 'is not valid without a user_id' do
    @reservation.user_id = nil
    expect(@reservation).to_not be_valid
  end
end
