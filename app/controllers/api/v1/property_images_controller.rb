class Api::V1::PropertyImagesController < ApplicationController
  before_action :find_property_image, except: %i[create index]
  ALLOWED_DATA = %i[source property_id].freeze

  def index
    @property_images = PropertyImage.all
    render json: { success: true, data: @property_images }, status: :ok
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def show
    render json: { success: true, data: @property_image }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property image not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def create
    property_image = PropertyImage.new(create_params)

    if property_image.save
      render json: { success: true, data: property_image }, status: :created
    else
      render json: { success: false, error: 'Cannot save property image' }, status: :bad_request
    end
  end

  def update
    if @property_image.update(update_params)
      render json: { success: true, data: @property_image }, status: :ok
    else
      render json: { success: false, errors: 'Cannot update property' }, status: :unprocessable_entity
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    @property_image.destroy
    render json: { success: true, data: @property_image }, status: :ok
  end

  private

  def find_property_image
    @property_image = PropertyImage.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property image not found' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end
end
