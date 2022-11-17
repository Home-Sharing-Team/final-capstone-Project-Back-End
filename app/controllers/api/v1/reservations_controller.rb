class Api::V1::ReservationsController < ApplicationController
  before_action :find_reservation, only: %i[show update destroy]
  ALLOWED_DATA = %i[check_in check_out user_id guests price hosting_id].freeze

  def index
    begin
      @reservations = Reservation.all
      render json: { success: true, data: @reservations }, status: :ok
    rescue ActiveRecord::ActiveRecordError
      render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
    end
  end

  def fetch_user_reservations
    begin
      @reservations = Reservation.where(user: params[:userId])

      reservations = JSON.parse(@reservations.to_json({ include: [:hosting, { user: { except: :password_digest } }] }))
      
      reservations = reservations.map do |reservation|
        property_id = reservation["hosting"]["property_id"]
        property = Property.find(property_id)
        images = PropertyImage.where(property:).limit(1)
        property_hash = JSON.parse(property.to_json)
        property_hash["images"] = images
        reservation["property"] = property_hash
        reservation
      end

      render json: { success: true, data: reservations }, status: :ok
    rescue ActiveRecord::ActiveRecordError
      render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
    end
  end

  def show    
    begin
      render json: { success: true, data: @reservation }, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { success: false, error: 'Reservation not found' }, status: :not_found
    rescue ActiveRecord::ActiveRecordError
      render json: { success: false, error: 'Internal server error.' }, status: :internal_server_error
    end
  end

  def create
    @reservation = Reservation.new(create_params)
    if @reservation.save
      hosting = Hosting.find(params[:hosting_id])

      @blocked_period = BlockedPeriod.new(property_id: hosting.property_id, start_date: params[:check_in],
                                          end_date: params[:check_out])
      if @blocked_period.save
        reservation = build_reservation(@reservation)
        render json: { success: true, data: reservation }, status: :created
      else
        render json: { success: false, error: 'Cannot save reservation' }, status: 500
      end
    else
      render json: { success: false, error: @reservation.errors }, status: :unprocessable_entity
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
    hosting = Hosting.find(@reservation.hosting_id)
    reservation_blocked_period = BlockedPeriod.find_by(
      property_id: hosting.property_id,
      start_date: @reservation.check_in
    )
    reservation_blocked_period.destroy
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

  def build_reservation(reservation)
    reservation_to_send = JSON.parse(reservation.to_json({ include: [:hosting, { user: { except: :password_digest } }] }))
    property_id = reservation_to_send["hosting"]["property_id"]
    property = Property.find(property_id)
    images = PropertyImage.where(property:).limit(1)
    property_hash = JSON.parse(property.to_json)
    property_hash["images"] = images
    reservation_to_send["property"] = property_hash
    reservation_to_send
  end
end
