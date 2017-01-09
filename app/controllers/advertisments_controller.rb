class AdvertismentsController < ApplicationController
  def show
  	@advertisment = Advertisment.friendly.find(params[:id])
  end
end
