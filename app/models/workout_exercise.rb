class WorkoutExercise < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
  
  belongs_to :workout
  belongs_to :exercise

  has_many :workout_sets, dependent: :destroy
end
