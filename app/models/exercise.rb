class Exercise < ApplicationRecord
  has_many :workouts, through: :workout_exercises
  has_many :workout_exercises, dependent: :destroy

  validates :name, presence: true, uniqueness: :true
end
