Rails.application.routes.draw do
  mount MountableEngine::Engine, at: 'mountable_engine'
end
