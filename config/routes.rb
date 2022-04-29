Rails.application.routes.draw do
  resources :critics
  resources :users
  resources :involved_companies
  resources :games
  resources :genres
  resources :platforms
  resources :companies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
