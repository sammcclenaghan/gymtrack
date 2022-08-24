class Workout < ApplicationRecord
  has_many :exercises, through: :workout_exercises
  has_many :workout_exercises, dependent: :destroy

  validates :name, presence: true
end
