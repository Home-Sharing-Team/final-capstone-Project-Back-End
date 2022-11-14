require 'swagger_helper'

RSpec.describe 'api/v1/property_images', type: :request do
  path '/api/v1/property_images' do
    get('list property_images') do
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

    post('create property_image') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property_image, in: :body, schema: {
          type: :object,
          properties: {
            source: { type: :string },
            property_id: { type: :bigint }
          },
          required: %w[source property_id]
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

  path '/api/v1/property_images/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show property_image') do
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

    patch('update property_image') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property_image, in: :body, schema: {
          type: :object,
          properties: {
            source: { type: :string },
            property_id: { type: :bigint }
          },
          required: %w[source property_id]
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

    put('update property_image') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property_image, in: :body, schema: {
          type: :object,
          properties: {
            source: { type: :string },
            property_id: { type: :bigint }
          },
          required: %w[source property_id]
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

    delete('delete property_image') do
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
