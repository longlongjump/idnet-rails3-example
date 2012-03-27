IdnetRails3Example::Application.routes.draw do
  resources :users

  match 'login' => 'user_session#new'
  get "user_session/create"

  get "user_session/destroy"

  match '/auth/:provider/callback' => 'user_session#create'

  root :to => 'welcome#index'
end
