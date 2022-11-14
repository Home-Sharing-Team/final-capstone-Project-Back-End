require 'swagger_helper'

RSpec.describe 'api/v1/hostings', type: :request do
  path '/api/v1/hostings' do
    get('list hostings') do
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

    post('create hosting') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :hosting, in: :body, schema: {
          type: :object,
          properties: {
            cycle: { type: :integer },
            minimum_cycle_amount: { type: :integer },
            rate: { type: :float },
            public: { type: :boolean },
            cleaning_fee: { type: :float },
            user_id: { type: :bigint },
            property_id: { type: :bigint }
          },
          required: %w[cycle minimum_cycle_amount rate public cleaning_fee user_id property_id]
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

  path '/api/v1/hostings/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show hosting') do
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

    patch('update hosting') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :hosting, in: :body, schema: {
          type: :object,
          properties: {
            cycle: { type: :integer },
            minimum_cycle_amount: { type: :integer },
            rate: { type: :float },
            public: { type: :boolean },
            cleaning_fee: { type: :float },
            user_id: { type: :bigint },
            property_id: { type: :bigint }
          },
          required: %w[cycle minimum_cycle_amount rate public cleaning_fee user_id property_id]
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

    put('update hosting') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :hosting, in: :body, schema: {
          type: :object,
          properties: {
            cycle: { type: :integer },
            minimum_cycle_amount: { type: :integer },
            rate: { type: :float },
            public: { type: :boolean },
            cleaning_fee: { type: :float },
            user_id: { type: :bigint },
            property_id: { type: :bigint }
          },
          required: %w[cycle minimum_cycle_amount rate public cleaning_fee user_id property_id]
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

    delete('delete hosting') do
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
