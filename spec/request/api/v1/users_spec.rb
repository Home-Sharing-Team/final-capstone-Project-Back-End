require 'rails_helper'
RSpec.describe 'users', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /api/v1/users' do
    it 'returns all users' do
      User.create!(email: 'davidtest7@gmail.com', name: 'David', password: '123456')

      get '/api/v1/users'

      expect(response).to have_http_status(200)

      users = JSON.parse(response.body)
      expect(users.length).to eq(2)
    end
  end
end
