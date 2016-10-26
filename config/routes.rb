Rails.application.routes.draw do
  resources :recalls, only: [:index, :create]
  resources :companies, only: [:show]
end
