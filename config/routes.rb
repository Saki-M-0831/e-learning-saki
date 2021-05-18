Rails.application.routes.draw do
  
  namespace :admin do
    get 'words/index'
    get 'words/new'
  end
  get 'words/index'
  get 'words/new'
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

    resources :categories do
      resources :words
    end
  end

  resources :pages
  resources :users do
    member do
      get "followers"
      get "followings"
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
