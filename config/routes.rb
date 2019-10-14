Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]

  post '/signin', to: 'users#signin'
  post '/newAccount', to: 'users#newAccount'
  post '/createNewGoal', to: 'goals#createNewGoal'
  post '/deleteGoal', to: 'goals#deleteGoal'

  resources :goals

  get '/validate', to: 'users#validate'
  get '/getUserData', to: 'users#getUserData'
  get '/getAccPartner', to: 'users#getAccPartner'

end
