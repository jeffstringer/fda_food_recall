Rails.application.routes.draw do
  resources :recalls, only: [:index, :create]
  post 'recalls', to: 'recalls#create', constraints: lambda { |request| request.env['SERVER_NAME'] == Rails.application.secrets.server_name }
  root 'recalls#index'
end
