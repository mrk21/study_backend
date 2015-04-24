Rails.application.routes.draw do
  mount Peek::Railtie => '/peek'
  
  resources :values, only: :index
end
