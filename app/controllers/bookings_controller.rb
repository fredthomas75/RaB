class BookingsController < ApplicationController
  def index
    authorize @booking
    @bookings = Booking.all
  end

  def show
    authorize @booking
    @booking = Booking.find(params[:id])
  end

  def new
    authorize @booking
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def create
    authorize @booking
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    if @booking.save
      redirect_to booking_path(@booking.boat)
    else
      render :new
    end
  end

  def edit
    authorize @booking
    @booking = Booking.find(params[:id])
  end

  # Pas certain de la formulation pour l'update
  def update
    authorize @booking
    @booking = Booking.find(params[:id])
    @booking.booking_params
    redirect_to booking_path(@booking.boat)
  end

  def destroy
    authorize @booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:boat).permit(:start_date, :end_date, :boat_id, :status)
  end
end
