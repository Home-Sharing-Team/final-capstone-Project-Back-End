require 'rails_helper'

RSpec.describe 'categories', type: :request do
    before(:all) do
        Rails.application.load_seed
    end
    
    describe 'GET /api/v1/categories' do
        it 'returns all categories' do
        get '/api/v1/categories'

        expect(response).to have_http_status(200)

        categories = JSON.parse(response.body)
        expect(categories.length).to eq(2)
        end
    end

    describe 'POST /api/v1/categories' do
        subject { post '/api/v1/categories', params: params }
        context 'when the params are valid' do
            let(:params) do
                {
                    name: 'Casa',
                    description: 'Casa de campo',
                    icon: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.es%2Ficonos-gratis%2Ficono-casa_1009562.htm&psig=AOvVaw0b8wZ6R5yJl0y5j3qkX5lq&ust=1606740720492000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJiB5uWJ8O0CFQAAAAAdAAAAABAD'
                }
            end
            it 'creates a new category' do
                expect { subject }.to change { Category.count }.by(1)
                expect(response).to have_http_status(201)
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

    describe 'GET /api/v1/categories/:id' do
        subject { get "/api/v1/categories/#{category_id}" }
        
        context 'when the category does not exist' do
            let(:category_id) { 'invalid' }
            it 'returns not found status' do
                subject
                expect(response).to have_http_status(404)
            end
        end
    end

   
        
end