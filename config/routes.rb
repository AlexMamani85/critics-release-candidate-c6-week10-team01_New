Rails.application.routes.draw do
  root "games#index"
  
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }

  resources :critics
  resources :involved_companies
  resources :games
  resources :genres
  resources :platforms
  resources :companies
  #resources :users
end
