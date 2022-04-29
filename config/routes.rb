Rails.application.routes.draw do
  devise_for :users
  resources :critics
  resources :users
  resources :involved_companies
  resources :games
  resources :genres
  resources :platforms
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"
end
