Secondlife::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",registrations: "registrations"}

  resources :users , only: [:index, :show, :edit,:update]
  
  get "welcome/index"

  root 'welcome#index'


end
