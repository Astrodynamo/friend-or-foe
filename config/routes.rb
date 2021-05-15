Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clients, only: [:new, :create, :show, :index]

  resources :users, only: [:new, :create, :show]
  get '/login', to: 'users#login'
  post '/login', to: 'users#verify_login'
  get '/logout', to: 'users#logout'
end
