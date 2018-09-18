Rails.application.routes.draw do
  resources :comments
  resources :notes
  resources :projects
  resources :users
  namespace :api do
    namespace :v1 do
      resources :users
      resources :projects
      resources :notes
      resources :comments
    end
  end
end
