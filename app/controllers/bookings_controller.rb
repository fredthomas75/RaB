class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :confirm_summary, :accept, :refuse, :destroy]

  def index
    @bookings = policy_scope(Booking)
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
    @booking.status = "Summary"
    @booking.boat = @boat
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render 'boats/show'
    end
  end

  def edit
    end

  # Pas certain de la formulation pour l'update
  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking.boat)
  end

  def confirm_summary
    @booking.status = 'Pending'
    @booking.save
    redirect_to booking_path(@booking)
  end

  def accept
    @booking.status = 'Confirmed'
    @booking.save
    redirect_to booking_path(@booking)
  end

  def refuse
    @booking.status = 'Refused'
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
