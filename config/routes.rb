Rails.application.routes.draw do
  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#create'
  post '/search', to: 'restaurants#search'
  root controller: :restaurants, action: :index
  resources :restaurants, only: [:show, :index]
end
