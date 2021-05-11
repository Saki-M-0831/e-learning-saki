Rails.application.routes.draw do
  root 'pages#home'

  resources :pages
  resources :users
end
