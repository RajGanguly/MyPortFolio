Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'enter-my-portfolio', sign_out: 'bye-bye', sign_up: 'register'}
  get 'angular-items', to: 'portfolios#angular'
  get 'rails-items', to: 'portfolios#rails'

  resources :portfolios, except: [:show] 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  get 'pages/contact'

  resources :blogs do
  	member do
  		get :change_status
  	end	
  end	

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
