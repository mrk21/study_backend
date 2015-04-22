Rails.application.routes.draw do
  resources :values, only: [:index, :create, :destroy]
  root 'values#index'
end
