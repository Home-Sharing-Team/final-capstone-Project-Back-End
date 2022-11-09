class Api::V1::ReservationsController < ApplicationController
    before_action :find_reservation, only: %i[show update destroy]
    ALLOWED_DATA = %i[check_in check_out user_id quests price hosting_id].freeze

    def index
        @reservations = Reservation.all
        render json: { success: true, data: @reservations }, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { success: false, error: 'Reservations not found' }, status: :not_found
    end

    def show
        render json: { success: true, data: @reservation }, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { success: false, error: 'Reservation not found' }, status: :not_found
    end

    def create
        @reservation = Reservation.new(create_params)
        if @reservation.save
            render json: { success: true, data: @reservation }, status: :created
        else
            render json: { success: false, error: @reservation.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @reservation.update
            render json: { success: true, data: @reservation }, status: :ok
        else
            render json: { success: false, errors: 'Cannot update reservation' }, status: :unprocessable_entity
        end
    end

    def destroy
        @reservation.destroy
        render json: { success: true, data: @reservation }, status: :ok
    end

    private

    def find_reservation
        @reservation = Reservation.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: { success: false, error: 'Reservation not found' }, status: :not_found
    end

    def create_params
        params.permit(ALLOWED_DATA)
    end
end
