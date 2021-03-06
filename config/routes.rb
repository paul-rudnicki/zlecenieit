Rails.application.routes.draw do

  namespace :panel do
    get 'users/edit'
  end

  namespace :panel do
    get 'users/update'
  end

  root 'pages#home'

  get '/rejestracja' => 'users#new'
  get '/reset-hasla' => 'users#reset_password'
  post '/recover' => 'users#recover_password'
  get '/generate_new_password/:id' => 'users#generate_new_password', as: 'generate_new_password'

  resources :categories, only: [:show], :path => 'kategoria'
  resources :geolocations, only: [:show], :path => 'lokalizacja'
  resources :advertisments, only: [:show], :path => 'zlecenie' do
    resources :offers, only: [:new, :create]
  end

  resources :users, only: [:show, :new, :create], :path => 'uzytkownik'

  get '/panel' => 'panel/dashboards#cockpit'

  namespace :panel do
    
    get '/logowanie' => 'sessions#new'
    get '/wyloguj' => 'sessions#destroy'

    get '/kokpit' => 'dashboards#cockpit'
    get '/ogloszenia' => 'dashboards#advertisments'
    get '/oferty' => 'dashboards#offers'
    get '/profil' => 'dashboards#profil'

    get '/weryfikacja' => 'dashboards#verify'

    get '/dodaj-ogloszenie' => 'advertisments#new'

    get '/zakoncz/:id' => 'dashboards#finish', as: 'zakoncz'

    get '/wybierz-zwyciezce/:id' => 'dashboards#choose_winner', as: 'choose_winner'
    post '/zapisz-zwyciezce/:id' => 'dashboards#save_winner', as: 'save_winner'

    resources :sessions, only: [:new, :create, :destroy]
    resources :advertisments, only: [:new, :create, :edit, :update]
    resources :offers, only: [:destroy]
    resources :users, only: [:edit, :update], :path => 'ustawienia'

  end


end
