Rails.application.routes.draw do
  root 'pages#home'
  get '/about', to: "pages#about"

  namespace :admin do
    get 'users/home'
  end
  namespace :admin do
    get 'pages/home'
  end

  resources :pages
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
