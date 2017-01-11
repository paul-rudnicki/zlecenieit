Rails.application.routes.draw do

  resources :offers
  # get 'users/show'

  # get 'advertisments/show'

  # get 'categories/show'

  # get 'geolocations/show' as: 'kategoria'

  root 'pages#home'

  get '/rejestracja' => 'users#new'

  resources :categories, only: [:show], :path => 'kategoria'
  resources :geolocations, only: [:show], :path => 'lokalizacja'
  resources :advertisments, only: [:show], :path => 'zlecenie' do
    resources :offers, only: [:new, :create]
  end
  resources :users, only: [:show, :new, :create]

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
