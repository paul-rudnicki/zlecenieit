class Panel::UsersController < ApplicationController

	layout 'panel'
	
  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(strong_params)
  		redirect_to edit_panel_user_path(@user), notice: 'Poprawnie zaktualizowano dane.'
  	else
  		flash[:alert] = "Nie udało się zaktualizować danych."
  		render :edit
  	end
  end

  private

  def strong_params
  	params.require(:user)
  		.permit(:name, :surname, :phone, :skype, :city, :province, :description)
  end
end
