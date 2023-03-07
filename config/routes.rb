Rails.application.routes.draw do
  root 'user#show'

  get 'newplan', to: 'userworkout#new', as: 'new_workout_plan'
  post 'createplan', to: 'userworkout#create', as: 'create_workout_plan'

  post 'add_workout/:id', to: 'userworkout#add_workout', as: 'add_workout'
  delete 'remove_workout/:id', to: 'userworkout#remove_workout', as: 'remove_workout'

  devise_for :users
end
