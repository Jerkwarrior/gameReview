# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # resources :users
  resources :companies, only: [:index]
  resources :games, only: %i[index show], defaults: { format: 'json' } do
    resources :reviews
  end
  root 'visitor#index'
end
