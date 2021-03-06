class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /boats
  def index
    @boats = policy_scope(Boat)

    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { boat: boat }),
        # image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end

    if params[:query].present?
      @boats = Boat.search_by_name_and_description(params[:query])
    end

  end

  # GET /boats/:id
  def show
    authorize @boat
    @coordinates = [{ lat: @boat.latitude, lng: @boat.longitude }]
    @booking = Booking.new
  end

  # GET /boats/new
  def new
    @boat = Boat.new
    authorize @boat
  end

  # POST /boats
  def create
    @boat = Boat.new(boat_params)
    authorize @boat
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  # GET /boats/:id/edit
  def edit
    authorize @boat
  end

  # PATCH /boats/:id
  def update
    authorize @boat
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  # DELETE /boat/:id
  def destroy
    authorize @boat
    @boat.destroy
    redirect_to root_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :capacity, :year, :num_of_cabin, :category, :user_id, :brand_model_id, :photo, :photo_cache, :price)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
