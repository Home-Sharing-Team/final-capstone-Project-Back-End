class Api::V1::AuthenticationController < ApplicationController
  before_action :authenticate_user, only: [:current_user]

  def sign_in
    unless params[:email] && params[:password]
      return render json: { success: false, error: 'Invalid request! Missing information.' },
                    status: :bad_request
    end

    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JwtToken.sign({ user_id: user.id })
      user_to_send = JSON.parse(user.to_json({ except: :password_digest }))

      render json: {
        success: true,
        data: {
          user: user_to_send,
          accessToken: token
        }
      }, status: :ok
    else
      render json: { success: false, error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def register
    user = User.new(register_user_params)
    if user.save
      user_to_send = JSON.parse(user.to_json({ except: :password_digest }))

      render json: { success: true, data: user_to_send }, status: :created
    else
      render json: { success: false, error: user.errors }, status: :bad_request
    end
  end

  def current_user
    render json: { success: true, data: @current_user }, status: :ok
  end

  private 

  def register_user_params
    params.permit(:name, :email, :password)
  end
end
