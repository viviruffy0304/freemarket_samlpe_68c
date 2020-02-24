Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "signup_users#index"
  resources :products, only: [:index]
  resources :informations, only: [:index]
  resources :tests, only: :show
  resources :users do
    collection do
      get :logout
      get :howToPay
    end
  end 

  resources :signin_users, only: [:show]
  resources :signup_users, only: [:index] do
    collection do
      get :done
    end
  end
end
