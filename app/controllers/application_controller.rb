class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :geolocations_sidebar
  
  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def geolocations_sidebar
		geolocations_sidebar = Geolocation.all.order(name: :asc)
	end
end
