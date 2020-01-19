Rails.application.routes.draw do
  resources :collections
  resources :users
  resources :museums
  resources :artists
  resources :artworks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
