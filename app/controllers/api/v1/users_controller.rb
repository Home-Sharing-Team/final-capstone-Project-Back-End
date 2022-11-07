class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!
  ALLOWED_DATA = %i[name email password password_confirmation role].freeze

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) && allow != :role }
    return render json: { error: 'Cant create user Admin' }, status: :unprocessable_entity if data.empty?

    user = User.new(data)
    if user.save
      render json:  {success: true, data: user}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if current_user.admin? :admin
      data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
      return render json: { error: 'Cant update user Admin' }, status: :unprocessable_entity if data.empty?

      if @user.update(data)
        render json: @user, status: :ok
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'you dont have authorization' }, status: :unauthorized
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      render json: @user, status: :ok
    else
      render json: { error: 'you dont have authorization' }, status: :unauthorized
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end
end
