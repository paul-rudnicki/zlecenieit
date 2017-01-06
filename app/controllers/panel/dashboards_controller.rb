class Panel::DashboardsController < Panel::ApplicationController
  def cockpit
    @active_advertisments_count = active_advertisments.count
    @wating_advertisments_count = waiting_winner_advertisments.count
    @ended_advertisments_count = ended_advertisments.count
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

  private

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
