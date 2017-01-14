class PagesController < ApplicationController
  def home
  	@advertisments = Advertisment.active.page(params[:page])
  end
end
