class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user, only: %i[create destroy fetch_user_reservations]
  before_action :find_reservation, only: %i[show update destroy]
  ALLOWED_DATA = %i[check_in check_out user_id guests price hosting_id].freeze

  def index
    @reservations = Reservation.all
    render json: { success: true, data: @reservations }, status: :ok
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def fetch_user_reservations
    if @current_user.id == params[:user_id].to_i
      @reservations = Reservation.where(user: params[:user_id])

      reservations = JSON.parse(@reservations.to_json({ include: [:hosting, { user: { except: :password_digest } },
                                                                  { property: { include: [:images] } }] }))

      render json: { success: true, data: reservations }, status: :ok
    else
      render json: { success: false, error: 'You are not authorized to complete this action.' }, status: :forbidden
    end
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def show
    render json: { success: true, data: @reservation }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'Reservation not found' }, status: :not_found
  rescue ActiveRecord::ActiveRecordError
    render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
  end

  def create
    hosting = Hosting.find(params[:hosting_id])
    @blocked_period = BlockedPeriod.new(property_id: hosting.property_id, start_date: params[:check_in],
                                        end_date: params[:check_out])
    if @blocked_period.save
      @reservation = Reservation.new(create_params)
      @reservation.property_id = hosting.property_id
      @reservation.blocked_period_id = @blocked_period.id

      if @reservation.save
        reservation = build_reservation(@reservation)
        render json: { success: true, data: reservation }, status: :created
      else
        @blocked_period.destroy
        render json: { success: false, error: @reservation.errors }, status: :unprocessable_entity
      end
    else
      render json: { success: false, error: @blocked_period.errors }, status: :bad_request
    end
  end

  def update
    if @reservation.update(update_params)
      render json: { success: true, data: @reservation }, status: :ok
    else
      render json: { success: false, errors: 'Cannot update reservation' }, status: :unprocessable_entity
    end
  end

  def update_params
    params.permit(ALLOWED_DATA)
  end

  def destroy
    if @current_user.id == @reservation.user_id
      @reservation.destroy
      reservation_blocked_period = BlockedPeriod.find(@reservation.blocked_period_id)
      reservation_blocked_period.destroy

      render json: { success: true, data: @reservation }, status: :ok
    else
      render json: { success: false, error: 'You are not authorized to complete this action.' }, status: :forbidden
    end
  end

  private

  def find_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { success: false, error: 'No reservation found with this ID.' }, status: :not_found
  end

  def create_params
    params.permit(ALLOWED_DATA)
  end

  def build_reservation(reservation)
    JSON.parse(reservation.to_json({ include: [:hosting, { user: { except: :password_digest } },
                                               { property: { include: [:images] } }] }))
  end
end
