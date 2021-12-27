# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: 
  {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/buyer' => "users/registrations#buyer"
    get '/users/seller' => "users/registrations#seller"
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'admins', to: 'admins#show'
end
