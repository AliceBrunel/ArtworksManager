Rails.application.routes.draw do


  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  resources :collections
  resources :museums
  resources :artists
  resources :artworks do 
	member do
		get 'add_to_collection'
		end
	end 
  resources :users, only: [:show]
	
  root to: 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
