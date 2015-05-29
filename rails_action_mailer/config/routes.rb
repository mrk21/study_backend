Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  post 'welcome/send_mail'
end
