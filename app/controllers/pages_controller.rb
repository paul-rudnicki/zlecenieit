class PagesController < ApplicationController
  def home
  	@advertisments = Advertisment.active.page(params[:page]).per(10)
  end
end
