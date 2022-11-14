require 'swagger_helper'

RSpec.describe 'api/v1/blocked_periods', type: :request do
  path '/api/v1/blocked_periods' do
    get('list blocked_periods') do
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

    post('create blocked_period') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :blocked_period, in: :body, schema: {
          type: :object,
          properties: {
            start_date: { type: :date },
            end_date: { type: :date },
            property_id: { type: :bigint }
          },
          required: %w[start_date end_date property_id]
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

  path '/api/v1/blocked_periods/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show blocked_period') do
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

    patch('update blocked_period') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :blocked_period, in: :body, schema: {
          type: :object,
          properties: {
            start_date: { type: :date },
            end_date: { type: :date },
            property_id: { type: :bigint }
          },
          required: %w[start_date end_date property_id]
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

    put('update blocked_period') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :blocked_period, in: :body, schema: {
          type: :object,
          properties: {
            start_date: { type: :date },
            end_date: { type: :date },
            property_id: { type: :bigint }
          },
          required: %w[start_date end_date property_id]
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

    delete('delete blocked_period') do
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
