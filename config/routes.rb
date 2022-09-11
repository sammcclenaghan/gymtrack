Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  
  resources :workout_exercises do
    resources :workout_sets
  end
  
  resources :favourites, only: [:create, :destroy]
  resources :workouts
  resources :exercises
end
