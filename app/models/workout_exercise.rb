class WorkoutExercise < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
  
  belongs_to :workout
  belongs_to :exercise

  has_many :workout_sets, dependent: :destroy

  def total_weight
    workout_sets.sum(&:total_weight)
  end
end
