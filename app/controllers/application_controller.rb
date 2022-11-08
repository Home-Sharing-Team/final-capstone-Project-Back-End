class ApplicationController < ActionController::API
  include JwtToken

  protected

  def authenticate_user
    header = request.headers['Authorization']
    token = header.split.last if header

    begin
      @decoded = JwtToken.verify(token)

      curr_time = Time.now
      if curr_time > @decoded[:exp]
        return render json: { success: false, error: 'Invalid token!' },
                      status: :unauthorized
      end

      @current_user = User.find(@decoded[:user_id])
      @current_user.password_digest = nil
    rescue ActiveRecord::RecordNotFound => e
      render json: { success: false, e: }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { success: false, error: 'Invalid token!' }, status: :unauthorized
    end
  end
end
