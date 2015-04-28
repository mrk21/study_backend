Rails.application.routes.draw do
  root 'values#index'
  resources :values, only: [:index]
end
