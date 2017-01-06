Rails.application.routes.draw do

  # get 'geolocations/show'

  root 'pages#home'

  resources :geolocations, only: [:show]

  get '/panel' => 'panel/dashboards#cockpit'
  
  namespace :panel do
    
    get '/logowanie' => 'sessions#new'
    get '/wyloguj' => 'sessions#destroy'

    get '/kokpit' => 'dashboards#cockpit'
    get '/ogloszenia' => 'dashboards#advertisments'
    get '/oferty' => 'dashboards#offers'
    get '/profil' => 'dashboards#profil'
    get '/ustawienia' => 'dashboards#settings'
    get '/weryfikacja' => 'dashboards#verify'

    get '/dodaj-ogloszenie' => 'advertisments#new'

    # get '/zakoncz' => 'dashboards#finish'

    resources :sessions, only: [:new, :create, :destroy]
    resources :advertisments, only: [:new, :create, :edit, :update]
    resources :offers, only: [:destroy]

  end


end
