Rails.application.routes.draw do
  devise_for :users
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index]
  resources :orders, only: [:show, :create, :update]
  resources :charges, only: [:new, :create]
end
