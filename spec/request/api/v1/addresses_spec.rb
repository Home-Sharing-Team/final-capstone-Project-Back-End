require 'rails_helper'

RSpec.describe 'addresses', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /api/v1/addresses' do
    it 'returns all addresses' do
      get '/api/v1/addresses'

      expect(response).to have_http_status(200)

      addresses = JSON.parse(response.body)
      expect(addresses.length).to eq(2)
    end
  end

  describe 'POST /api/v1/addresses' do
    subject { post '/api/v1/addresses', params: }
    context 'when the params are valid' do
      let(:params) do
        {
          street: 'Calle 3',
          city: 'Bogota',
          country: 'Colombia',
          postal_code: '12345',
          number: 1,
          zip_code: '12345'
        }
      end
      it 'creates a new address' do
        expect { subject }.to change { Address.count }.by(1)
        expect(response).to have_http_status(201)
      end
    end
    context 'when the params are invalid' do
      let(:params) { { street: '' } }
      it 'returns unprocessable entity status' do
        subject
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'GET /api/v1/addresses/:id' do
    subject { get "/api/v1/addresses/#{address_id}" }

    context 'when the address does not exist' do
      let(:address_id) { 'invalid' }
      it 'returns not found status' do
        subject
        expect(response).to have_http_status(404)
      end
    end
  end
end
