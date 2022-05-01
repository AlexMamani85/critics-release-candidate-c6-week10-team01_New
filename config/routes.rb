Rails.application.routes.draw do
  root "games#index"
  
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }

  
  resources :involved_companies

  resources :games do 

    resources :critics, only: %i[create destroy]

    post "add_genre", on: :member

    delete "remove_genre", on: :member
  
    post "add_platform", on: :member
    
    delete "remove_platform", on: :member

    post "add_developer", on: :member

    delete "remove_developer", on: :member

    post "add_publisher", on: :member

    delete "remove_publisher", on: :member
  end

  resources :genres
  resources :platforms
  resources :companies do
    resources :critics, only: %i[create destroy]
  end
  
end
