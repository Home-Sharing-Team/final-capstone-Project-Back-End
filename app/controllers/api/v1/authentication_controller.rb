class Api::V1::AuthenticationController < ApplicationController
    def sign_in
        return render json: { success: false, error: 'Invalid request! Missing information.' }, status: 400 unless params[:email] && params[:password]

        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            user.password_digest = nil
            token = JwtToken.sign({ user_id: user.id })
            render json: { 
                success: true, 
                data: { 
                    user:, 
                    accessToken: token
                } 
            }, status: 200
        else
            render json: { success: false, error: 'Invalid email or password' }, status: :unauthorized
        end
    end
end

    