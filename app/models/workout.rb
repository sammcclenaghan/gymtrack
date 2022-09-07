class Workout < ApplicationRecord
  has_many :exercises, through: :workout_exercises
  has_many :workout_exercises, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
