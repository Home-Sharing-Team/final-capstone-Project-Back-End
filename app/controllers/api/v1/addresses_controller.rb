class Api::V1::AddressesController < ApplicationController
  before_action :find_address, except: %i[create index]

  ALLOWED_DATA = %i[street number city country zip_code].freeze

  def index
    begin
      @addresses = Address.all
      render json: { success: true, data: @addresses }, status: :ok
    rescue ActiveRecord::ActiveRecordError
      render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
    end
  end

  def show
    begin
      render json: { success: true, data: @address }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: 'Address not found' }, status: :not_found
    rescue ActiveRecord::ActiveRecordError
      render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
    end
  end

  def create
    address = Address.new(create_params)
    if address.save
      render json: { success: true, data: address }, status: 201
    else
      render json: { success: false, error: 'Cannot save address' }, status: :bad_request
    end
  end

  def update
    if @address.update(update_params)
      render json: { success: true, data: @address }, status: :ok
    else
      render json: { success: false, error: 'Cannot update address' }, status: :bad_request
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    @address.destroy
    render json: { success: true, data: @address }, status: :ok
  end

  private

  def find_address
    @address = Address.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Address not found' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end
end
