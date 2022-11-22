require 'rails_helper'

RSpec.describe 'properties', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /api/v1/properties' do
    subject { get '/api/v1/properties' }
    it 'returns all properties' do
      subject
      expect(response).to have_http_status(200)
      properties = JSON.parse(response.body)
      expect(properties.length).to eq(2)
    end
  end
  describe 'POST /api/v1/properties' do
    subject { post '/api/v1/properties', params: }
    context 'when the params are valid' do
      let(:params) do
        {
          name: 'Casa 3',
          description: 'Casa 3',
          guest_capacity: 3,
          bedrooms: 3,
          beds: 3,
          baths: 3,
          kind: 'apartment',
          address_id: 1,
          size: 3,
          user_id: 1
        }
      end
    end
    context 'when the params are invalid' do
      let(:params) { { name: '' } }
      it 'returns unprocessable entity status' do
        subject
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'GET /api/v1/properties/:id' do
    subject { get "/api/v1/properties/#{property_id}" }

    context 'when the property does not exist' do
      let(:property_id) { 'invalid' }
      it 'returns not found status' do
        subject
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'PUT /api/v1/properties/:id' do
    subject { put "/api/v1/properties/#{property_id}", params: params }

    context 'when the property does not exist' do
      let(:property_id) { 'invalid' }
      let(:params) { { name: 'Casa 3' } }
      it 'returns not found status' do
        subject
        expect(response).to have_http_status(401)
      end
    end
  end

  
end

