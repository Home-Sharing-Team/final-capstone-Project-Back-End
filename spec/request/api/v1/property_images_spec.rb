require 'rails_helper'

RSpec.describe 'property_images', type: :request do
    before(:all) do
        Rails.application.load_seed
    end

    describe 'GET /api/v1/property_images' do
        it 'returns all property_images' do
        get '/api/v1/property_images'

        expect(response).to have_http_status(200)

        property_images = JSON.parse(response.body)
        expect(property_images.length).to eq(2)
        end
    end

    describe 'POST /api/v1/property_images' do
        subject { post '/api/v1/property_images', params: params }
        context 'when the params are valid' do
            let(:params) do
                {
                    url: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F555266120671233633%2F&psig=AOvVaw3Z7V8E0xu1X9y9Jtj9eV8r&ust=1603890080001000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIjOvZaY0ewCFQAAAAAdAAAAABAD', 
                    property_id: 51
                }
            end
        end
        context 'when the params are invalid' do
            let(:params) { { name: '' } }
            it 'returns unprocessable entity status' do
                subject
                expect(response).to have_http_status(400)
            end
        end
    end

    describe 'GET /api/v1/property_images/:id' do
        subject { get "/api/v1/property_images/#{property_image_id}" }

        context 'when the property_image does not exist' do
            let(:property_image_id) { 'invalid' }
            it 'returns not found status' do
                subject
                expect(response).to have_http_status(404)
            end
        end
    end

end