Rails.application.routes.draw do
  resources :charges
  root 'store#index', as: 'store'
  resources :items, only: [:show, :index]
  post "items/:id/add_to_cart", to: "items#add_to_cart"
  resources :carts
  resources :item_lines, only: [:create]
  resources :orders, only: [:show]
  resources :sessions
  resources :users, :only => [:new, :show, :index]
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'
end
