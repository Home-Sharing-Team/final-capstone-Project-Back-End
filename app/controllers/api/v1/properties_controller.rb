class Api::V1::PropertiesController < ApplicationController
before_action :authorize_request
before_action :find_property, except: %i[create index]

ALLOWED_DATA = %i[name address city state zip price description user_id].freeze

def index
    @properties = Property.all
    render json: {success: true, data: @properties}, status: 200
rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Properties not found' }, status: 404
end

def show
    render json: {success: true, data: @property}, status: 200
rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Property not found' }, status: 404
end 

def create
    data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
    return render json: { success: false, error: 'Can not create property without all the requested information' }, status: 400 if data.empty?

    property = Property.new(data)
    if property.save
        render json:  {success: true, data: property}, status: 201
    else
        render json: { success: false, error: 'Cannot save property' }, status: 400
    end

    def update
        data = json_payload.select { |allow| ALLOWED_DATA.include?(allow) }
        return render json: {success: false, error: 'Cant update property' }, status: 422 if data.empty?

        if @property.update(data)
            render json: {success: true, data: @property}, status: 400
        else
            render json: { success: false, errors: 'Cannot update property' }, status: 422
        end
    end

    def destroy
        can? :destroy, @property
        @property.destroy
        render json: {success: true, data: @property}, status: 200
    end

    private

    def find_property
        @property = Property.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { success: false, error: 'Property not found' }, status: 404
    end
end
