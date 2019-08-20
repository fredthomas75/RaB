class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  def index
    @boats = Boat.all
    authorize @boat
  end

  # GET /boats/:id
  def show
    link_to boat_path(@boat)
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
    @boat.update(boat_params)
    authorize @boat
    redirect_to boat_path(@boat)
  end

  # DELETE /boat/:id
  def destroy
    @boat.destroy
    authorize @boat
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :description, :capacity, :year, :num_of_cabin, :category, :user_id, :brand_model_id, :photo)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
