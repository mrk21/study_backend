Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount GraphiQL::Rails::Engine, at: '/dev/graphql', graphql_path: '/queries'
  root to: redirect('/dev/graphql')
  resources :queries, only: :create
end
