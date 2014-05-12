Secondlife::Application.routes.draw do

  get 'backgrounds/new'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",registrations: "registrations"}

  resources :users , only: [:index, :show, :edit,:update]
  
  get "welcome/index"

  root 'welcome#index'

  %w[about intro privacy terms contact].each do |page|
    get page, controller: "info", action: page
  end
  
  concern :photoable do
    resources :photos, only: [:index, :new, :create, :show, :destroy]
  end

  concern :commentable do
    resources :comments, only: [:index, :new, :create, :show, :destroy]
  end
  
  resource :backgrounds, :only => :new

  resources :articles do
    concerns :commentable
    concerns :photoable
    member do
      put "like", to: "articles#upvote"
      put "dislike", to: "articles#downvote"
    end
    collection { get :search, to: 'articles#search' }
  end
  
  resources :searches

  get 'trends/:group', to: 'articles#index', as: :group
end
