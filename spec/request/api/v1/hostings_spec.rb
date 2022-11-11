require 'rails_helper'

RSpec.describe 'hostings', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

    describe 'GET /api/v1/hostings' do
        it 'returns all hostings' do
        get '/api/v1/hostings'

        expect(response).to have_http_status(200)

        hostings = JSON.parse(response.body)
        expect(hostings.length).to eq(2)
        end
    end

    describe 'POST /api/v1/hostings' do
        subject { post '/api/v1/hostings', params: params }
        context 'when the params are valid' do
            let(:params) do
                {
                    cycle: 2, 
                    minimum_cycle_amount: 2,
                     rate: 12, 
                     public: true, 
                     cleaning_fee: 1, 
                     user_id: 44, 
                     property_id: 51
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

    describe 'GET /api/v1/hostings/:id' do
        subject { get "/api/v1/hostings/#{hosting_id}" }

        context 'when the hosting does not exist' do
            let(:hosting_id) { 'invalid' }
            it 'returns not found status' do
                subject
                expect(response).to have_http_status(404)
            end
        end
    end


end