Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  
  resources :workout_exercises do
    resources :workout_sets
  end

  resources :workouts do
    post 'clone', on: :member
    resource :favourites, only: [:create, :destroy]
  end
  resources :exercises
end
