require 'rails_helper'

RSpec.describe User, type: :model do 
    before do
        @user = User.create(name: 'David', email: 'davidtest@gmail.com', password: '123456', password_confirmation: '123456')
    end

    it 'is valid with valid attributes' do
        expect(@user).to be_valid
    end

    it 'is not valid without a name' do
        @user.name = nil
        expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
        @user.email = nil
        expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
        @user.password = nil
        expect(@user).to_not be_valid
    end


    it 'is not valid if password and password confirmation are different' do
        @user.password_confirmation = '1234567'
        expect(@user).to_not be_valid
    end

    it 'is not valid if email is not unique' do
        user2 = User.create(name: 'David', email: 'davidtest@gmail.com', password: '123456', password_confirmation: '123456')

        expect(user2).to_not be_valid
    end

    it 'is not valid if password is less than 6 characters' do
        @user.password = '12345'
        expect(@user).to_not be_valid
    end

    it 'is not valid if password is more than 20 characters' do
        @user.password = '123456789012345678901'
        expect(@user).to_not be_valid
    end

    it 'is not valid if password confirmation is less than 6 characters' do
        @user.password_confirmation = '12345'
        expect(@user).to_not be_valid
    end

    it 'is not valid if password confirmation is more than 20 characters' do
        @user.password_confirmation = '123456789012345678901'
        expect(@user).to_not be_valid
    end


    
end