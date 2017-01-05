Rails.application.routes.draw do

  get '/panel' => 'panel/dashboards#cockpit'
  root 'pages#home'

  namespace :panel do
    
    get '/logowanie' => 'sessions#new'
    get '/wyloguj' => 'sessions#destroy'

    get '/kokpit' => 'dashboards#cockpit'
    get '/ogloszenia' => 'dashboards#advertisments'
    get '/oferty' => 'dashboards#offers'
    get '/profil' => 'dashboards#profil'
    get '/ustawienia' => 'dashboards#settings'
    get '/weryfikacja' => 'dashboards#verify'

    resources :sessions, only: [:new, :create, :destroy]
  end


end
