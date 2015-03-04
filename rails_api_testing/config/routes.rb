Rails.application.routes.draw do
  namespace :api, format: 'json' do
    resources :users, except: [:new, :edit]
  end
end
