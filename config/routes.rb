Rails.application.routes.draw do
  
  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  
  scope 'api/v1' do
    resources :boats

    resources :users, only: [:index, :show]

    resources :trips do
      resources :clients, shallow: true
    end
  end
end
