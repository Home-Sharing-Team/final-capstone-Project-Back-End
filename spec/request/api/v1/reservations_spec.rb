require 'rails_helper'

RSpec.describe 'reservations', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /api/v1/reservations' do
    it 'returns all reservations' do
      get '/api/v1/reservations'

      expect(response).to have_http_status(200)

      reservations = JSON.parse(response.body)
      expect(reservations.length).to eq(2)
    end
  end

  describe 'GET /api/v1/reservations/:id' do
    subject { get "/api/v1/reservations/#{reservation_id}" }

    context 'when the reservation does not exist' do
      let(:reservation_id) { 'invalid' }
      it 'returns not found status' do
        subject
        expect(response).to have_http_status(404)
      end
    end
  end
end
