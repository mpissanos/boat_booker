Rails.application.routes.draw do
  
  root to: 'trips#index'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show]
  resources :boats
  
  get '/clients', to: 'clients#index'
  get '/clients/new', to: 'clients#new'  
  post '/clients', to: 'clients#create'
  
  resources :trips do
    resources :clients, shallow: true
  end

  
end
