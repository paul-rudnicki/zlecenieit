class UsersController < ApplicationController
	require 'bcrypt'

	layout "register", only: [:new, :create]
	layout "recover", only: [:reset_password, :recover_password]

  def show
    @user = User.find(params[:id])
    @advertisment_count = @user.advertisments.where(status: true).count
    @offers_count = @user.offers.count
  end

  def new
  	@user = User.new
  	render layout: "register"
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
        # redirect_to rejestracja_path
      end
    else
      flash[:alert] = 'Email lub Hasła nie są identyczne'
      render :new
  		# redirect_to rejestracja_path
  	end
  end

  def reset_password
  end

  def recover_password
  	if params[:user][:email].present?
  		if User.exists?(email: params[:user][:email])

  		  user = User.find_by(email: params[:user][:email])

  		  user.save_confirmation
  		  
  			UsersMailer.generate_confirmation_notify(user.email, user.confirmation).deliver

  			redirect_to :back, notice: "Wysłano email z prośbą o zresetowanie hasła"
  		else
	  		redirect_to :back, alert: "Taki email nie istnieje w bazie danych"
  		end
  	else
  		# flash[:alert] = 'Nie podano email'
  		redirect_to :back, alert: "Nie podano adresu E-mail"
  	end
  end

  def generate_new_password
  	if params[:id].present?
  		user = User.find_by(confirmation: params[:id])
  		if user
		  	new_password = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle.first(8).join
		  	hash_password = BCrypt::Password.create(new_password)
		  	user.update_attribute(:password_digest, hash_password)
		  	UsersMailer.send_new_password(user.email, new_password).deliver
		  	redirect_to panel_logowanie_path, notice: "Wysłano wygenerowane nowe hasło na E-email"
  		else
		  	redirect_to root_path, alert: "Link stracił ważność, prosimy o wygenerowanie nowego."
  		end
		else
		  	redirect_to root_path, alert: "Niepoprawny url do resetowania hasła"
  	end
  end

  private

  def strong_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
