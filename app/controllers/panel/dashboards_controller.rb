class Panel::DashboardsController < Panel::ApplicationController
  def cockpit
    @active_advertisments_count = active_advertisments.count
    @wating_advertisments_count = waiting_winner_advertisments.count
    @ended_advertisments_count = ended_advertisments.count

    @active_offers_count = active_offers_count.count
    @waiting_offers_count = waiting_winner_offers_count.count
    @ended_offers_count = ended_offers.count

  end

  def advertisments
    if params[:status].present?
      case params[:status]
      when 'waiting_mod'
        @layout = 'mod'
        @title = 'Oczekujące na moderacje'
        @advertisments = waiting_moderation_advertisments.page(params[:page]).per(5)
      when 'waiting_winner'
        @title = 'Oczekujące na zwycięzce'
        @layout = 'winner'
        @advertisments = waiting_winner_advertisments.page(params[:page]).per(5)
      when 'ended'
        @layout = 'ended'
        @title = 'Zakończone ogłoszenia'
        @advertisments = ended_advertisments.page(params[:page]).per(5)
      else
        @title = 'Aktywne ogłoszenia'
        @advertisments = active_advertisments.page(params[:page]).per(5)  
      end
    else
      @title = 'Aktywne ogłoszenia'
      @advertisments = active_advertisments.page(params[:page]).per(5)
    end
  end

  def offers
    if params[:status].present?
      case params[:status]
      when 'won'
        @layout = 'won'
        @title = 'Wygrane oferty'
        @advertisments = won_offers.page(params[:page]).per(5)
      when 'ended'
        @layout = 'ended'
        @title = 'Zakończone oferty'
        @advertisments = ended_offers.page(params[:page]).per(5)
      else
        @title = 'Aktywne oferty'
        @advertisments = active_offers.page(params[:page]).per(5)
      end
    else
      @title = 'Aktywne oferty'
      @advertisments = active_offers.page(params[:page]).per(5)
    end
  end

  def profile
  end

  def settings
  end

  def verify
  end

  def choose_winner
  	@advertisment = Advertisment.friendly.find(params[:id])
  	
  	@offers = @advertisment.offers.all
  	@users = Array.new
  	@offers.each do |offer|
  		@users << ["#{offer.user.email} - #{offer.user.name}", offer.user.id]
  	end
  end

  def save_winner
  	advertisment = Advertisment.friendly.find(params[:id])
  	if advertisment
  		user_id = params[:user].to_i
  		advertisment.winner = user_id
  		advertisment.save
  		redirect_to panel_ogloszenia_path(status: 'ended'), notice: 'Zwycięzca został wybrany.'
  	else
  		redirect_to panel_ogloszenia_path(status: 'waiting_winner'), alert: 'Zwycięzca nie został zapisany poprawnie.'
  	end
  end

  def finish
    advertisment = Advertisment.friendly.find(params[:id])
    if advertisment
      advertisment.closed = true
      #advertisment.ended_date = DateTime.now
      advertisment.save
      redirect_to panel_ogloszenia_path(status: 'waiting_winner'), notice: 'Ogłoszenie zostało zamkięte.'
    else
      redirect_to panel_ogloszenia_path, alert: 'Błąd - ogłoszenie nie zostało zamknięte'
    end
  end

  private

  def active_offers_count
    Advertisment.joins(:offers).where(offers: {user_id: session[:user_id]})
      .where(closed: false)
  end

  def waiting_winner_offers_count
    Advertisment.joins(:offers).where(offers: {user_id: session[:user_id]})
      .where(closed: true).where(winner: nil) 
  end

  def ended_offers_count
    Advertisment.joins(:offers).where(offers: {user_id: session[:user_id]})
      .where(closed: true).where.not(winner: nil)
  end

  def active_offers
    Advertisment.joins(:offers).where(offers: {user_id: session[:user_id]})
      .order(ended_date: :asc)
  end

  def won_offers
    Advertisment.joins(:offers).where(offers: {user_id: session[:user_id]})
      .where(closed: true).where(winner: session[:user_id])
      .order(ended_date: :asc)
  end

  def ended_offers
    Advertisment.joins(:offers).where(offers: {user_id: session[:user_id]})
      .where(closed: true).where.not(winner: nil).where.not(winner: session[:user_id])
      .order(ended_date: :asc)
  end


  def waiting_moderation_advertisments
    Advertisment.where(status: false)
        .where(user_id: session[:user_id]).order(created_at: :desc)
  end

  def active_advertisments
    Advertisment.where(status: true).where(closed: false)
        .where(user_id: session[:user_id]).order(ended_date: :asc)
  end

  def waiting_winner_advertisments
    Advertisment.where(closed: true).where(winner: nil)
          .where(user_id: session[:user_id]).order(ended_date: :asc)
  end

  def ended_advertisments
    Advertisment.where(closed: true).where.not(winner: nil)
          .where(user_id: session[:user_id]).order(ended_date: :asc)
  end

end
