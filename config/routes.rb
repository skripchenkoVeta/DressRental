# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: 
  {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth'
  }

  devise_scope :user do
    get '/users/buyer' => "users/registrations#buyer"
    get '/users/seller' => "users/registrations#seller"
    end
    scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  root to: "home#index"
  resources :products do
    resources :comments
   end
  resources :salons do
    resources :comments
   end
  resources :product_types
  resources :rentals
  resources :user
  post 'user/confirmation' => "user#confirmation"
  post 'user/ban' => "user#ban"
  post 'rentals/approve' => "rentals#approve"
  post 'rentals/status' => "rentals#status"
  post 'rentals/sanction' => "rentals#sanction"
  get '/menu' => "seller_profile#menu"
  get 'salon/menu' => "salons#menu"
  get 'product/menu' => "products#menu"
  get 'home/catalog' => "home#catalog"
  get 'home/catalog_salons' => "home#catalog_salons"
  end
end
