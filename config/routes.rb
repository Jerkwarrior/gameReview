Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resources :companies, only: [:index]
  resources :games, only: [:index, :show], defaults: { format: 'json' } do
    resources :reviews
  end
  root 'visitor#index'
end
