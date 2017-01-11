class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :geolocations_sidebar, :is_user_not_offered?
  
  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def geolocations_sidebar
		geolocations_sidebar = Geolocation.all.order(name: :asc)
	end

	def is_user_not_offered? offers
		if offers.where(user_id: current_user.id).count == 0
			true
		else
			false
		end
	end

end
