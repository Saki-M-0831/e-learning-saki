Rails.application.routes.draw do
  namespace :admin do
    get 'pages/home'
    resources :articles, :comments
  end
  root 'pages#home'

  resources :pages
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
