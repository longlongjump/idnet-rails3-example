IdnetRails3Example::Application.routes.draw do
  resources :users

  get "user_session/create"

  get "user_session/destroy"

  match '/auth/:provider/callback' => 'user_session#create'
  match '/auth/failure' => 'user_session#failure'

  root :to => 'welcome#index'
end
