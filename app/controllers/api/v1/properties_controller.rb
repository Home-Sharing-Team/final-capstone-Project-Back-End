class Api::V1::PropertiesController < ApplicationController
  # before_action :authorize_request
  before_action :authenticate_user, only: %i[create destroy update]
  before_action :find_property, except: %i[fetch_user_properties create index]

  ALLOWED_DATA = %i[name description guest_capacity bedrooms beds baths kind size user_id address_id].freeze

  def index
    if params[:category]
      category = Category.find(params[:category])
      @properties = category.properties
    else
      @properties = Property.all
    end

    properties = JSON.parse(@properties.to_json({ include: %i[images min_cycle_hosting address] }))

    render json: { success: true, data: properties }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'No category found with this ID.' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def fetch_user_properties
    @properties = Property.where(user: params[:user_id])
    render json: { success: true, data: @properties }, status: :ok
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def show
    property = JSON.parse(@property.to_json({ include: [:images, :blocked_periods, :categories, :min_cycle_hosting,
                                                        :address, :hostings, { user: { except: :password_digest } }] }))

    render json: { success: true, data: property }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def create
    property = Property.new(create_params)

    if property.save
      property.categories << array_of_categories

      render json: { success: true, data: property }, status: :created
    else
      render json: { success: false, error: 'Cannot save property' }, status: :bad_request
    end
  end

  def update
    if @current_user.id == @property.user_id || @current_user.role == "admin"
      if @property.update(update_params)
        render json: { success: true, data: @property }, status: :ok
      else
        render json: { success: false, errors: 'Cannot update property' }, status: :unprocessable_entity
      end
    else
      render json: { success: false, error: 'You are not authorized to complete this action.' }, status: :forbidden
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    if @current_user.id == @property.user_id || @current_user.role == "admin"
      @property.destroy
      render json: { success: true, data: @property }, status: :ok
    else
      render json: { success: false, error: 'You are not authorized to complete this action.' }, status: :forbidden
    end
  end

  private

  def array_of_categories
    category_test = Category.find_by_id(1)
    category_test2 = Category.find_by_id(2)
    [category_test, category_test2]
  end

  def find_property
    @property = Property.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property not found' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end
end
