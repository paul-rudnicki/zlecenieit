class OffersController < ApplicationController
	def create
		advertisment = Advertisment.friendly.find(params[:advertisment_id])
		@offer = advertisment.offers.new(strong_params)
		@offer.user_id = session[:user_id]
		if @offer.save
			redirect_to advertisment_path(advertisment), notice: "Dodano nową ofertę"
		else
			flash[:alert] = 'Prosimy wypełnienie pola: Treść ogłoszenia'
			redirect_to advertisment_path(advertisment)
		end
	end

	private
		def strong_params
			params.require(:offer).permit(:realization, :price, :content)
		end
end
