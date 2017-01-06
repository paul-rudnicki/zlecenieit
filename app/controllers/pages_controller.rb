class PagesController < ApplicationController
  def home
  	@advertisments = Advertisment.active.page(params[:page]).per(2)
  end
end
