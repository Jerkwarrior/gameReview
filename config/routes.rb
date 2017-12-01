Rails.application.routes.draw do
  resources :companies, only: [:index]
  resources :games, only: [:index, :show], defaults: { format: 'json' }
  root 'visitor#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
