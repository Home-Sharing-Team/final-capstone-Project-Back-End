class Api::V1::HostingsController < ApplicationController
  before_action :authenticate_user, only: %i[create update destroy]
  before_action :check_ownership, only: %i[create update destroy]
  before_action :find_hosting, only: %i[show update destroy]
  ALLOWED_DATA = %i[cycle minimum_cycle_amount rate cleaning_fee public user_id property_id].freeze

  def index
    @hostings = Hosting.all
    render json: { success: true, data: @hostings }, status: :ok
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def show
    render json: { success: true, data: @hosting }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Hosting not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def create
    @hosting = Hosting.new(create_params)
    if @hosting.save
      render json: { success: true, data: @hosting }, status: :created
    else
      render json: { success: false, error: @hosting.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @hosting.update(update_params)
      render json: { success: true, data: @hosting }, status: :ok
    else
      render json: { success: false, errors: 'Cannot update hosting' }, status: :unprocessable_entity
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    @hosting.destroy
    render json: { success: true, data: @hosting }, status: :ok
  end

  private

  def find_hosting
    @hosting = Hosting.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Hosting not found' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end

  def check_ownership
    property = Property.find(params[:property_id])

    return unless @current_user.id != params[:user_id] || property.user_id != @current_user.id

    render json: { success: false, error: 'You are not authorized to complete this action' }, status: :forbidden
  end
end
