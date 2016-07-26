Rails.application.routes.draw do
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  get 'errors/not_found'

  get 'errors/internal_server_error'

  resources :brands
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :documents, :path => "docs"
  resources :sessions
  resources :categories
  get 'hub/index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get  'dashboard', to: 'hub#dashboard', as: 'dashboard'
     
  root 'hub#index', as: 'hub'


end
