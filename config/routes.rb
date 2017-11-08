Rails.application.routes.draw do
  resources :companies
  resources :games, defaults: { format: 'json' }
  root 'visitor#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
