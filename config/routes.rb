Rails.application.routes.draw do
  devise_for :users
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index] do
    resources :reviews, only: [:create]
  end
  resources :orders, only: [:show, :create, :update]
  resources :charges, only: [:new, :create]
end
