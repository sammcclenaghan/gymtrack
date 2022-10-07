class WorkoutSet < ApplicationRecord
  belongs_to :workout_exercise

  def total_weight
    weight * reps
  end

end
