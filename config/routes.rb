Rails.application.routes.draw do
  root 'users#index'

  resources :stylists do
    resources :appointments, only: [:index, :new, :create]
  end
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

  delete '/logout' => "sessions#destroy" 

  get "*path" => redirect("/")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
