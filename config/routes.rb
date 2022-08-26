Rails.application.routes.draw do
  resources :workout_exercises
  resources :workouts
  resources :exercises
  resources :workout_sets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workouts#index"
end
