Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]

  post '/signin', to: 'users#signin'
  post '/newAccount', to: 'users#newAccount'
  post '/createNewGoal', to: 'goals#createNewGoal'

  resources :goals

  get '/validate', to: 'users#validate'
  get '/getUserData', to: 'users#getUserData'

end
