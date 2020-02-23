Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products#new"
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

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'step1'
      post 'step2'
      post 'step3'  #入力が全て完了
      get 'complete_signup'  #登録完了後
    end
  end
  
end
