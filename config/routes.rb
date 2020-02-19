Rails.application.routes.draw do
  root 'signin_users#index'
  resources :signin_users, only: [:index]
  resources :signup_users, only: [:index, :new]
end
