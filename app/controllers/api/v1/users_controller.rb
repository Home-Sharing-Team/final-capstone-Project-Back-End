class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!
  ALLOWED_DATA = %i[name email password password_confirmation role].freeze

  def index
    @users = User.all
    render json: {success: true, data: @users}, status: 200
  end

  def show
    render json: {success: true, data: @user}, status: 200
  end

  def create
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) && allow != :role }
    return render json: { success: false, error: 'Can not create user without all the requested information' }, status: 400 if data.empty?

    user = User.new(data)
    if user.save
      render json:  {success: true, data: user}, status: 201
    else
      render json: { success: false, error: 'Cannot save user' }, status: 400
    end
  end

  def update
    if current_user.admin? :admin
      data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
      return render json: {success: false, error: 'Cant update user Admin' }, status: 422 if data.empty?

      if @user.update(data)
        render json: {success: true, data: @user}, status: 400
      else
        render json: { success: false, errors: 'Cannot update User' }, status: 422
      end
    else
      render json: { success: false, error: 'you dont have authorization' }, status: 401
    end
  end

  def destroy
    if current_user.admin?
      @user.destroy
      render json: {success: true, data: @user}, status: 200
    else
      render json: { success: false, error: 'you dont have authorization' }, status: 401
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'User not found' }, status: 404
  end
end
