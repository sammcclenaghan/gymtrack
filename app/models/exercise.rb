class Exercise < ApplicationRecord
  has_many :workout_exercises, dependent: :destroy
  has_many :workouts, through: :workout_exercises

  validates :name, presence: true, uniqueness: :true
end
