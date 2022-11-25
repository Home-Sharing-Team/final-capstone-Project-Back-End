require 'rails_helper'

RSpec.describe 'blocked_periods', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET /api/v1/blocked_periods' do
    it 'returns all blocked_periods' do
      get '/api/v1/blocked_periods'

      expect(response).to have_http_status(200)

      blocked_periods = JSON.parse(response.body)
      expect(blocked_periods.length).to eq(2)
    end
  end

  describe 'POST /api/v1/blocked_periods' do
    subject { post '/api/v1/blocked_periods', params: }
    context 'when the params are valid' do
      let(:params) do
        {
          start_date: '2023-11-13',
          end_date: '2023-12-28',
          property_id: 1
        }
      end
    end
  end

  describe 'GET /api/v1/blocked_periods/:id' do
    subject { get "/api/v1/blocked_periods/#{blocked_period_id}" }

    context 'when the blocked_period does not exist' do
      let(:blocked_period_id) { 'invalid' }
      it 'returns not found status' do
        subject
        expect(response).to have_http_status(404)
      end
    end
  end
end
