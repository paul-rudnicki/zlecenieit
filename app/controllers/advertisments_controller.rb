class AdvertismentsController < ApplicationController
  def show
  	@advertisment = Advertisment.friendly.find(params[:id])
  	@offer = Offer.new(:advertisment => @advertisment )
  end
end
