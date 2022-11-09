class Api::V1::HostingsController < ApplicationController
before_action :find_hosting, only: %i[show update destroy]
ALLOWED_DATA = %i[cycle minimum_cycle_amount rate cleaning_fee public user_id properties_id].freeze

def index
    @hostings = Hosting.all
    render json: { success: true, data: @hostings }, status: :ok
rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Hostings not found' }, status: :not_found
end

def show
    render json: { success: true, data: @hosting }, status: :ok
rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Hosting not found' }, status: :not_found
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
    if @hosting.update
        render json: { success: true, data: @hosting }, status: :ok
    else
        render json: { success: false, errors: 'Cannot update hosting' }, status: :unprocessable_entity
    end
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

end


