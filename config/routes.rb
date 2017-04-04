Rails.application.routes.draw do
  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  get 'errors/not_found'

  get 'errors/internal_server_error'

  resources :brands, except: %w(index, show)
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users, except: %w(new create)
  resources :documents, :path => "docs"
  get 'docs/:id/hide', to: 'documents#hide', as: 'hide'
  get 'docs/:id/unhide', to: 'documents#unhide', as: 'unhide'
  resources :sessions
  resources :categories
  get 'hub/index'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get  'dashboard', to: 'hub#dashboard', as: 'dashboard'
     
  root 'hub#index', as: 'hub'


end
