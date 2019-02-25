Rails.application.routes.draw do
  
  root to: 'trips#index'
  
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  
  

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index, :show]


  resources :boats

  resources :trips do
    resources :clients 
  end

    resources :clients, only: [:index, :show]
  

end
