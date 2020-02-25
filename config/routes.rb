Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "informations#index"
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

  resources :signup_users,  only: [:index, :create] do
    collection do
      get 'step1'
      post 'step2'  #入力が全て完了  #登録完了後
      get 'complete' #登録完了後
    end
  end
  
end
