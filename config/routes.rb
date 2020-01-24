Rails.application.routes.draw do
  root to: 'welcome#home'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/', to: 'sessions#destroy'

  resources :collections
  resources :users
  resources :museums
  resources :artists
  resources :artworks



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
