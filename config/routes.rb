# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: 
  {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    get '/users/buyer' => "users/registrations#buyer"
    get '/users/seller' => "users/registrations#seller"
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :products
  resources :salons
  resources :product_types
  resources :user
  post 'user/confirmation' => "user#confirmation"
  post 'user/ban' => "user#ban"
  get '/menu' => "seller_profile#menu"
  get 'salon/menu' => "salons#menu"
  get 'product/menu' => "products#menu"
end
