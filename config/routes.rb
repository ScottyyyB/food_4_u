Rails.application.routes.draw do
  devise_for :users
  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#create'
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index] do
    resources :reviews, only: [:create]
  end
  resources :orders, only: [:show, :create, :update]
end
