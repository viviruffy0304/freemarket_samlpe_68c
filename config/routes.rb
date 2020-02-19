Rails.application.routes.draw do

  root to: "users#logout"
  resources :informations, only: :index
  resources :tests, only: :show
  resources :users, only: :index do
    collection do
      get :logout
      get :howToPay
    end
  end 
end
