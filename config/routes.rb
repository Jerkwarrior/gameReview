Rails.application.routes.draw do
  resources :companies, only: [:index]
  resources :games, only: [:index, :show], defaults: { format: 'json' } do
    resources :reviews
  end
  root 'visitor#index'
end
