class Panel::OffersController < ApplicationController
  def destroy
  	offer = Offer.find(params[:id])
  	offer.destroy
  	redirect_to panel_oferty_path, notice: 'Pomyślnie usunięto ofertę'
  end
end
