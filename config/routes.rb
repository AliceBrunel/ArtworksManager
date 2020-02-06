Rails.application.routes.draw do


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :collections
  resources :museums
  resources :artists
  resources :artworks do 
	member do
		get 'add_to_collection'
		end
	end 

	
  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
