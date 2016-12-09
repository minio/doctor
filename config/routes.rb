CAT_AND_DOC_PATH_REGEX = %r{[a-z-_0-9]*(?:|\/[a-z-_0-9]*)}

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
  resources :documents, only: [:index, :new, :create], :path => "docs"
  get 'docs/(*id)/hide', constraints: {id: CAT_AND_DOC_PATH_REGEX}, to: 'documents#hide', as: 'hide'
  get 'docs/(*id)/unhide', constraints: {id: CAT_AND_DOC_PATH_REGEX}, to: 'documents#unhide', as: 'unhide'
  resources :sessions
  resources :categories
  get 'hub/index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get  'dashboard', to: 'hub#dashboard', as: 'dashboard'
     
  root 'hub#index', as: 'hub'

  get 'docs/(*id)/edit', constraints: {id: CAT_AND_DOC_PATH_REGEX},
                         to: 'documents#edit', as: "edit_document"
  get '/docs/(*id)', to: 'documents#show', as: "document"
  patch '/docs/(*id)', to: 'documents#update'
  put '/docs/(*id)', to: 'documents#update'
  delete '/docs/(*id)', to: 'documents#destroy'

  get '/document/check_name', to: 'documents#check_name'
  get '/document/check_slug', to: 'documents#check_slug'
end
