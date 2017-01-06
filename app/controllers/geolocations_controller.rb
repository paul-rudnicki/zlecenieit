class GeolocationsController < ApplicationController
  def show
  	@geolocation = Geolocation.friendly.find(params[:id])
  	@advertisments = @geolocation.advertisments.all().page(params[:page]).per(5)
  end
end
