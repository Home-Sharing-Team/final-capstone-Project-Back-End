class Api::V1::PropertiesController < ApplicationController
  # before_action :authorize_request
  before_action :authenticate_user, only: %i[create destroy update]
  before_action :find_property, except: %i[fetch_user_properties create index]

  ALLOWED_DATA = %i[name description guest_capacity bedrooms beds baths kind size].freeze

  def index
    if params[:category]
      category = Category.find(params[:category])
      @properties = category.properties.where(is_public: true)
    else
      @properties = Property.where(is_public: true)
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
    property_to_send = build_property(@property)

    render json: { success: true, data: property_to_send }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def create
    address = Address.new(create_address_params)
    
    if address.save
      @property = Property.new(create_property_params)
      @property.user_id = @current_user.id
      @property.address_id = address.id

      if @property.save
        params[:categories].each do |category_name|
          category = Category.find_by(name: category_name)
          PropertyCategory.create(
            property_id: @property.id,
            category_id: category.id
          )
        end
        
        latests_category = Category.find_by(name: "latests")
        PropertyCategory.create(
          property_id: @property.id,
          category_id: latests_category.id
        )

        property_to_send = build_property(@property)
        render json: { success: true, data: property_to_send }, status: :created
      else
        address.destroy
        render json: { success: false, error: 'Could not create property.' }, status: :bad_request
      end
    else
      render json: { success: false, error: 'Could not create the property address.' }, status: :bad_request
    end

  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Resource not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def update
    if @current_user.id == @property.user_id || @current_user.role == 'admin'
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
    if @current_user.id == @property.user_id || @current_user.role == 'admin'
      @property.destroy
      render json: { success: true, data: @property }, status: :ok
    else
      render json: { success: false, error: 'You are not authorized to complete this action.' }, status: :forbidden
    end
  end

  private

  def find_property
    @property = Property.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property not found' }, status: :not_found
  end

  def build_property(property)
    JSON.parse(property.to_json({ include: [:images, :blocked_periods, :categories, :min_cycle_hosting,
                                                        :address, :hostings, { user: { except: :password_digest } }] }))
  end

  def create_property_params
    params.permit(ALLOWED_DATA)
  end

  def create_address_params
    params.require(:address).permit(:street, :number, :city, :country, :zip_code, :continent)
  end
end
