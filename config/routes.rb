Rails.application.routes.draw do
  root 'home#index'
	
  resources :authorized, only: [:index]
  get 'authorized/stars', to: 'authorized#stars'
  get 'authorized/followers', to: 'authorized#followers'
    get 'authorized/following', to: 'authorized#following'    
	get '/auth/github', as: :github_login
	get '/auth/github/callback', to: 'sessions#create'
end
