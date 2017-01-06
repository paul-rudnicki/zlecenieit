class Panel::SessionsController < Panel::ApplicationController

	layout 'login'

	before_action :authorize, except: [:new, :create]

  def new
  end

  def create
  	@user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  	if @user
  		session[:user_id] = @user.id
  		redirect_to panel_kokpit_path, notice: 'Poprawnie zalogowanio do panelu'
  	else
  		flash[:alert] = 'Prosimy o podanie prawidłowego e-mail i hasła'
  		redirect_to panel_logowanie_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to new_panel_session_path, notice: 'Poprawnie wylogowano'
  end
end
