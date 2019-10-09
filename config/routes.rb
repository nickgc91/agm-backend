Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post '/signin', to: 'users#signin'
  resources :goals
end
