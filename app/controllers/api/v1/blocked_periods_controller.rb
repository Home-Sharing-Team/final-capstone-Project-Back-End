class Api::V1::BlockedPeriodsController < ApplicationController
  # before_action :authenticate_user
  ALLOWED_DATA = %i[start_date end_date property_id].freeze

  def index
    @blocked_periods = BlockedPeriod.all
    render json: { success: true, data: @blocked_periods }, status: :ok
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def show
    @blocked_period = BlockedPeriod.find(params[:id])
    render json: { success: true, data: @blocked_period }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Blocked period not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def create
    @blocked_period = BlockedPeriod.new(create_params)
    if @blocked_period.save
      render json: { success: true, data: @blocked_period }, status: :created
    else
      render json: { success: false, error: @blocked_period.errors }, status: :unprocessable_entity
    end
  end

  def update
    @blocked_period = BlockedPeriod.find(params[:id])
    if @blocked_period.update(update_params)
      render json: { success: true, data: @blocked_period }, status: :ok
    else
      render json: { success: false, errors: 'Cannot update blocked period' }, status: :unprocessable_entity
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    @blocked_period = BlockedPeriod.find(params[:id])
    @blocked_period.destroy
    render json: { success: true, data: @blocked_period }, status: :ok
  end

  private

  def find_blocked_period
    @blocked_period = BlockedPeriod.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Blocked period not found' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end
end
