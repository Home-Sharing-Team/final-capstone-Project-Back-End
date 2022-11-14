require 'swagger_helper'

RSpec.describe 'api/v1/properties', type: :request do
  path '/api/v1/properties' do
    get('list properties') do
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

    post('create property') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            guest_capacity: { type: :integer },
            bedrooms: { type: :integer },
            beds: { type: :integer },
            bathrooms: { type: :integer },
            kind: { type: :string },
            size: { type: :integer }
          },
          required: %w[name description guest_capacity bedrooms beds bathrooms kind size]
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

  path '/api/v1/properties/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show property') do
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

    patch('update property') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            guest_capacity: { type: :integer },
            bedrooms: { type: :integer },
            beds: { type: :integer },
            bathrooms: { type: :integer },
            kind: { type: :string },
            size: { type: :integer }
          },
          required: %w[name description guest_capacity bedrooms beds bathrooms kind size]
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

    put('update property') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :property, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            description: { type: :string },
            guest_capacity: { type: :integer },
            bedrooms: { type: :integer },
            beds: { type: :integer },
            bathrooms: { type: :integer },
            kind: { type: :string },
            size: { type: :integer }
          },
          required: %w[name description guest_capacity bedrooms beds bathrooms kind size]
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

    delete('delete property') do
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
