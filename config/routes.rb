Rails.application.routes.draw do

  root to: "users#index"
  resources :informations, only: [:index , :show]
  resources :tests, only: :show
  resources :users, only: :index do
    collection do
      get :logout
      get :howToPay
    end
  end 
end
