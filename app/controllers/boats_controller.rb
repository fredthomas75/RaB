class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  def index
    @boats = Boat.all
  end

  # GET /boats/:id
  def show
  end

  # GET /boats/new
  def new
    @boat = Boat.new
  end

  # POST /boats
  def create
    @boat = Boat.new(boat_params)

    @boat.save

    redirect_to boat_path(boat)
  end

  # GET /boats/:id/edit
  def edit
  end

  # PATCH /boats/:id
  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  # DELETE /boat/:id
  def destroy
    @boat.destroy

    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :location, :description, :capacity, :year, :num_of_cabin, :category, :user_id, :brand_model_id)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
