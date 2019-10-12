Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post '/signin', to: 'users#signin'
  resources :goals
  post '/newAccount', to: 'users#newAccount'
  get '/validate', to: 'users#validate'
  get '/getUserData', to: 'users#getUserData'
end
