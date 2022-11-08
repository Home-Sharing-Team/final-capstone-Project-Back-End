class ApplicationController < ActionController::API
  include JwtToken

  protected

  def authenticate_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
      @decoded = JwtToken.verify(token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => error
      render json: { success: false, error: }, status: :unauthorized
    rescue JWT::DecodeError => error
      render json: { success: false, error: }, status: :unauthorized
    end
  end
end
