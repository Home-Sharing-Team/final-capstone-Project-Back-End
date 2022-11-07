class AuthenticationController < ApplicationController
    ALLOWED_DATA = %i[email password].freeze

    def sign_in
        data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
        return render json: { error: 'Cant sign in because of missing data' }, status: 201 if data.empty?

        user = User.find_by(email: data[:email])
        if user&.authenticate(data[:password])
            render json: { success: true, data: user }, status: 200
        else
            render json: {success: false, error: 'Invalid email or password' }, status: 401
        end
    end

    