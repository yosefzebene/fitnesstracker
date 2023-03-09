Rails.application.routes.draw do
  root 'user#show'

  get 'newplan', to: 'userworkout#new', as: 'new_workout_plan'
  post 'createplan', to: 'userworkout#create', as: 'create_workout_plan'
  delete 'deleteplan', to: 'userworkout#delete', as: 'delete_workout_plan'

  post 'add_workout/:id&:day', to: 'userworkout#add_workout', as: 'add_workout'
  delete 'remove_workout/:id&:day', to: 'userworkout#remove_workout', as: 'remove_workout'

  get 'workouts/:day', to: 'workout#show', as: 'workouts'

  devise_for :users
end
