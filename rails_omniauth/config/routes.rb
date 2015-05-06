Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  resource :session, only: [:create, :destroy]
end
