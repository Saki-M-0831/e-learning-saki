Rails.application.routes.draw do

  get 'learned_words/index'
  root 'pages#home'
  get '/about', to: "pages#about"
  get '/dashboard', to: "users#dashboard"

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
  resources :categories
  
  resources :lessons do
    resources :answers
  end
end
