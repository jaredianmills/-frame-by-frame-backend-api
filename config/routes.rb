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
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
