require 'swagger_helper'

RSpec.describe 'api/v1/categories', type: :request do
  path '/api/v1/categories' do
    get('list categories') do
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

    post('create category') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: %w[name]
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

  path '/api/v1/categories/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show category') do
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

    patch('update category') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: %w[name]
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

    put('update category') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :category, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: %w[name]
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

    delete('delete category') do
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
