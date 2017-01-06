class Panel::ApplicationController < ApplicationController

	layout 'panel'

	before_action :authorize

	# helper_method :current_user

	# def current_user
	# 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	# end

	def authorize
		unless current_user
			redirect_to panel_logowanie_path
		end
	end

end