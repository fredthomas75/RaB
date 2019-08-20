class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /boats
  def index
    @boats = policy_scope(Boat)
  end

  # GET /boats/:id
  def show
    authorize @boat
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
    raise
    @boat.update(boat_params)
    authorize @boat
    redirect_to boat_path(@boat)
  end

  # DELETE /boat/:id
  def destroy
    authorize @boat
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :description, :capacity, :year, :num_of_cabin, :category, :user_id, :brand_model_id, :photo, :photo_cache)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
