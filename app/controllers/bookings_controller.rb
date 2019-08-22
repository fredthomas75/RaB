class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    authorize @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.boat = @boat
    if @booking.save
      redirect_to booking_path(@booking)
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
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
