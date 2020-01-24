Rails.application.routes.draw do
  root to: 'welcome#home'

  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: :user

  get '/login', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/logout/', to: 'sessions#destroy'

  resources :collections
  resources :museums
  resources :artists
  resources :artworks



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
