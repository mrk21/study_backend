Rails.application.routes.draw do
  get '/cache/:id' => 'cache#show'
end
