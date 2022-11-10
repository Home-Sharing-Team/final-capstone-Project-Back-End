class Api::V1::ReservationsController < ApplicationController
    before_action :find_reservation, only: %i[show update destroy]
    ALLOWED_DATA = %i[check_in check_out user_id guests price hosting_id].freeze

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
           hosting = Hosting.find(params[:hosting_id])

            @blocked_period = BlockedPeriod.new(property_id: hosting.properties_id, start_date: params[:check_in], end_date: params[:check_out])
            if @blocked_period.save
                render json: { success: true, data: @reservation }, status: :created
            else
                render json: { success: false, error: 'Cannot save reservation' }, status: 500
            end
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
