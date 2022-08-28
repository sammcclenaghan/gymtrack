Rails.application.routes.draw do
  resources :workout_exercises do
    resources :workout_sets
  end
  
  resources :workouts
  resources :exercises
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workouts#index"
end
