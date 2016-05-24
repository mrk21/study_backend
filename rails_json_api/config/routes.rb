Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :notes, only: [:index, :show]
end
