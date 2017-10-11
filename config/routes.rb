Rails.application.routes.draw do
  root 'home#index'
	
  resources :authorized, only: [:index]
	get '/auth/github', as: :github_login
	get '/auth/github/callback', to: 'sessions#create'
end
