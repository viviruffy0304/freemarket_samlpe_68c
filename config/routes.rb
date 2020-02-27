Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users


  root to: "signup_users#index"
  resources :products, only: [:index, :new]
  resources :informations, only: [:index , :show]
  resources :tests, only: :show do
    collection do
      get :pay
      get :done
    end
  end 

  resources :users, only: :index do
    collection do
      get :logout
      get :howToPay
    end
  end 

  resources :signin_users, only: [:show]


  resources :signup_users do
    collection do
      get 'step1'
      post 'step2'  #入力が全て完了  #登録完了後
      get 'complete' #登録完了後
    end
  end
  

  #resources :signup_users, only: [:index] do
    #collection do
      #get :done
      #get :address
    #end
  #end

end
