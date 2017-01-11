class UsersController < ApplicationController

	layout "register", only: [:new, :create]

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(strong_params)
  	valid = true
  	if params[:user][:email] != params[:user][:email_confirmation]
  		valid = false
  	elsif params[:user][:password] != params[:user][:password_confirmation]
  		valid = false
  	end

  	if valid
	  	if @user.save
	  		msg = 'Rejestracja przepiegła pomyślnie - możesz się zalogować';
	  		redirect_to panel_logowanie_path, notice: msg
	  	else
	  		flash[:alert] = 'Nie udało się zarejestrować'
	  		render :new
	  	end
	  else
  		flash[:alert] = 'Email lub Hasła nie są identyczne'
  		render :new
  	end
  end

  private

  def strong_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
