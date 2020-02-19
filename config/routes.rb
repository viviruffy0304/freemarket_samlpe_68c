Rails.application.routes.draw do

  root to: "users#howToPay"
  # get 'users/logout' to: 'user#logout'
  resources :informations, only: [:index]
  # resources :users, only: [:index]
  resources :tests, only: [:show]
  resources :users do
    collection do
      get :logout
      get :howToPay
    end
  end 
end
