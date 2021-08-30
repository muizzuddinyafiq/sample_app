Rails.application.routes.draw do
  resourcers :users
  root 'static_pages#home'
  get 'static_pages/help'
end
