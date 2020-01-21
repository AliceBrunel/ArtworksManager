Rails.application.routes.draw do
  
  
  resources :collections
  resources :users
  resources :museums
  resources :artists
  resources :artworks

  get '/signin', to: 'session#new', as: 'signin'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
