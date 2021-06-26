Rails.application.routes.draw do
  root 'users#index'

  resources :stylists
  resources :appointments
  resources :clients
  resources :users

  get '/signup' => "users#new"
  post '/signup' => "users#create"

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"

  delete '/logout' => "sessions#destroy" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
