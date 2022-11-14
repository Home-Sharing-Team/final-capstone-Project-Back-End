class Api::V1::CategoriesController < ApplicationController
  # before_action :authenticate_user
  before_action :find_category, only: %i[show update destroy]
  ALLOWED_DATA = %i[name].freeze

  def index
    @categories = Category.all
    render json: { success: true, data: @categories }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Categories not found' }, status: :not_found
  end

  def show
    render json: { success: true, data: @category }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Category not found' }, status: :not_found
  end

  def create
    category = Category.new(create_params)
    if category.save
      # category.properties << array_of_properties
      render json: { success: true, data: category }, status: :created
    else
      render json: { success: false, error: 'Cannot save category' }, status: :bad_request
    end
  end

  def update
    if @category.update(update_params)
      render json: { success: true, data: @category }, status: :ok
    else
      render json: { success: false, errors: 'Cannot update category' }, status: :unprocessable_entity
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    @category.destroy
    render json: { success: true, data: @category }, status: :ok
  end

  private

  # def array_of_properties
  # property_test = Property.find_by_id(3)
  # properties = [property_test]

  # end

  def find_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Category not found' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end
end
