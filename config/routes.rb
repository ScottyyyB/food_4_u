Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'orders_controller/create'
    end
  end

  devise_for :users
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index] do
    resources :reviews, only: [:create]
  end
  resources :orders, only: [:show, :create, :update]
  resources :charges, only: [:new, :create]
  namespace :api do
    namespace :v0 do
      resources :ping, only: [:index], constraints: { format: 'json' }
    end
    namespace :v1 do
      resources :restaurants, only: [:index]
      resources :orders, only: [:create]
    end
  end
end
