class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @boats = Boat.geocoded #returns flats with coordinates

    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
  end
end
