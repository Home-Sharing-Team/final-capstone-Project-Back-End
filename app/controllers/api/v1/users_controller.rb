class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user, only: [:index]
  ALLOWED_DATA = %i[name email password].freeze

  def index
    @users = User.all
    render json: {success: true, data: @users}, status: :ok
  end

  def show
    render json: {success: true, data: @user}, status: :ok
  end

  def create
    user = User.new(create_user_params)
    if user.save
      render json:  {success: true, data: user}, status: :created
    else
      render json: { success: false, error: 'Cannot save user' }, status: :bad_request
    end
  end

  def update
    if current_user.admin? :admin
      data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
      return render json: {success: false, error: 'Cant update user Admin' }, status: :unprocessable_entity if data.empty?

      if @user.update(data)
        render json: {success: true, data: @user}, status: :bad_request
      else
        render json: { success: false, errors: 'Cannot update User' }, status: :unprocessable_entity
      end
    else
      render json: { success: false, error: 'you dont have authorization' }, status: :unauthorized
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      render json: {success: true, data: @user}, status: :ok
    else
      render json: { success: false, error: 'you dont have authorization' }, status: :unauthorized
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'User not found' }, status: :not_found
  end

  def create_user_params
    params.permit(:name, :email, :password)
  end 
end
