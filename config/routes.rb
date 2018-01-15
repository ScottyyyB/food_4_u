Rails.application.routes.draw do
  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#create'
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index]
end
