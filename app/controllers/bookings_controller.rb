class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
  end

  def create
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
    @booking = Booking.find(params[:id])
  end

  # Pas certain de la formulation pour l'update
  def update
    @booking = Booking.find(params[:id])
    @booking.booking_params
    redirect_to booking_path(@booking.boat)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:boat).permit(:name, :location, :description, :capacity, :year, :num_of_cabin, :category, :user_id, :brand_id)
  end
end
