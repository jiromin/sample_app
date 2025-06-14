Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'

  # get 'static_pages/home'
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  "/signup",  to: "users#new"

  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users

  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  get '/microposts', to: 'static_pages#home'
  end
