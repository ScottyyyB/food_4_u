Rails.application.routes.draw do
  devise_for :users
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index]
  resources :orders, only: [:show, :create, :update, :index]
  get '/order', to: 'order#show'
end
