# rubocop:disable Metrics/BlockLength:
require 'swagger_helper'

RSpec.describe 'api/v1/addresses', type: :request do
  path '/api/v1/addresses' do
    get('list addresses') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create address') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :address, in: :body, schema: {
          type: :object,
          properties: {
            street: { type: :string },
            number: { type: :integer },
            city: { type: :string },
            country: { type: :string },
            zip_code: { type: :string }
          },
          required: %w[street number city country zip_code]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/addresses/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show address') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update address') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :address, in: :body, schema: {
          type: :object,
          properties: {
            street: { type: :string },
            number: { type: :integer },
            city: { type: :string },
            country: { type: :string },
            zip_code: { type: :string }
          },
          required: %w[street number city country zip_code]
        }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update address') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :address, in: :body, schema: {
          type: :object,
          properties: {
            street: { type: :string },
            number: { type: :integer },
            city: { type: :string },
            country: { type: :string },
            zip_code: { type: :string }
          },
          required: %w[street number city country zip_code]
        }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete address') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength:
