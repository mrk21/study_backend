Rails.application.routes.draw do
  get 'hello/:message' => 'home#hello'
end
