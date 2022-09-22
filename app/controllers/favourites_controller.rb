class FavouritesController < ApplicationController

  before_action :set_workout, only: [:create, :destroy]

  # Write the create action that corresponds to the POST route
  def create
    # Use the `favorite!` method to set the task's favorite boolean to true
    @workout.favourite!
    redirect_to workouts_url, notice: "Favourited"
  end

  # Write the destroy action that corresponds to the DELETE route
  def destroy
    # Use the `unfavorite!` method to set the workout's favorite boolean to false
    @workout.unfavourite!
    redirect_to workouts_url, notice: "Unfavorited"
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

end
