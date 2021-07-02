Rails.application.routes.draw do
  root 'users#index'

  resources :stylists
  resources :appointments
  resources :clients do
    resources :appointments, only: [:index, :new, :create]
  end
  resources :users

  get '/auth/:provider/callback' => 'sessions#omniauth'

  get '/signup' => "users#new"
  post '/signup' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  get '/logout' => "sessions#destroy" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
