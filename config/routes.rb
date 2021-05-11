Rails.application.routes.draw do
  root 'pages#home'

  resources :pages
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
