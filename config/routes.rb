Rails.application.routes.draw do
  resources :users

  namespace :api do
    resources :users
  end
end
