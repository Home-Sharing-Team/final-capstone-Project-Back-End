require 'rails_helper'

RSpec.describe 'auth_login', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'POST /api/v1/auth/sign_in' do
    subject { post '/api/v1/auth/sign_in', params: }
    context 'when the params are valid' do
      let(:params) do
        {
          email: 'david@gmail.com',
          password: '123456'
        }
      end
      it 'returns ok status' do
        subject
        expect(response).to have_http_status(200)
      end
    end
  end
end
