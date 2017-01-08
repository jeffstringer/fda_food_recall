Rails.application.routes.draw do
  resources :recalls, only: [:index, :create]
  root 'recalls#index'
end
