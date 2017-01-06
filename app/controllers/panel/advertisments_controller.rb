class Panel::AdvertismentsController < Panel::ApplicationController
  before_action :all_categories_and_geolocations

  def new
  	@advertisment = Advertisment.new
  end

  def create
  	@advertisment = Advertisment.new(strong_params)
  	@advertisment.user_id = current_user.id
    if @advertisment.save
      redirect_to panel_ogloszenia_path(status: 'waiting_mod'), notice: 'Dodano nowe ogłoszenie, które oczekuję na moderację'
    else
      flash[:alert] = 'Wystąpił problem z dodaniem nowego ogłoszenia'
      render :new
    end
  end

  def edit
    @advertisment = Advertisment.find(params[:id])
  end

  def update
    @advertisment = Advertisment.find(params[:id])
    if @advertisment.update(strong_params)
      redirect_to panel_ogloszenia_path, notice: 'Poprawwnie zaktualizowano ogłoszenie'
    else
      flash[:alert] = 'Wystąpił problem z aktualizacją ogłoszenia'
      render :edit
    end

  end

  private

  def strong_params
    if params[:action] == 'create'
    	params.require(:advertisment)
    		.permit(:title, :content, :category_id, :geolocation_id, :price, :realization)
    else
     params.require(:advertisment)
      .permit(:title, :content, :category_id, :geolocation_id, :price) 
    end
  end

  def all_categories_and_geolocations
    @categories = Category.all
    @geolocations = Geolocation.all
  end
end
