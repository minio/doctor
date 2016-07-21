Rails.application.routes.draw do
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
