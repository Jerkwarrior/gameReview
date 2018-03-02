# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users, skip: [:sessions]
  # as :user do
    # get 'users/sign_in', to: 'devise/sessions#new', as: :new_user_session
    # post 'users/sign_in', to: 'devise/sessions#create', as: :user_session
    # get 'users/signout', to: 'devise/sessions#destroy',
                         # as: :destroy_user_session
  # end

  resources :companies, only: [:index]
  resources :games, only: %i[index show], defaults: { format: 'json' } do
    resources :reviews
  end
  root 'visitor#index'
end
