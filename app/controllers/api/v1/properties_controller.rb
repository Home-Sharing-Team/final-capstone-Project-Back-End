class Api::V1::PropertiesController < ApplicationController
# before_action :authorize_request
before_action :find_property, except: %i[create index]

ALLOWED_DATA = %i[name address city state zip price description user_id].freeze

def index
    @properties = Property.all
    render json: {success: true, data: @properties}, status: :ok
rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Properties not found' }, status: :not_found
end

def show
    render json: {success: true, data: @property}, status: :ok
rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property not found' }, status: :not_found
end 

def create
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
    return render json: { success: false, error: 'Can not create property without all the requested information' }, status: :bad_request if data.empty?

    property = Property.new(data)
    if property.save
        render json:  {success: true, data: property}, status: 201
    else
        render json: { success: false, error: 'Cannot save property' }, status: :bad_request
    end

    def update
        data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
        return render json: {success: false, error: 'Cant update property' }, status: :unprocessable_entity if data.empty?

        if @property.update(data)
            render json: {success: true, data: @property}, status: :bad_request
        else
            render json: { success: false, errors: 'Cannot update property' }, status: :unprocessable_entity
        end
    end

    def destroy
        can? :destroy, @property
        @property.destroy
        render json: {success: true, data: @property}, status: :ok
    end

    private

    def find_property
        @property = Property.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { success: false, error: 'Property not found' }, status: :not_found
    end
end
