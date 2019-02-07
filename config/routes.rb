Rails.application.routes.draw do
  
  root to: 'trips#index'
  
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  
  devise_for :users 

  resources :trips do
    resources :clients 
  end

    
   
  
end
