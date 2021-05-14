Rails.application.routes.draw do
  
  root 'pages#home'
  get '/about', to: "pages#about"

  namespace :admin do
    get 'pages/home'

    resources :users do
      member do
        patch "add_admin"
        patch "remove_admin"
      end
    end

    resources :categories

  end

  resources :pages
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
