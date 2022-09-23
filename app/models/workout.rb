class Workout < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }

  has_many :exercises, through: :workout_exercises
  has_many :workout_exercises, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  def total_weight
    workout_exercises.sum(&:total_weight)
  end


  def self.from_workout(original_workout)
    workout = new
    workout.name = original_workout.name
    workout.starts_at = DateTime.now
    workout.user_id = original_workout.user_id
    workout.save!
    workout
  end

  def favourite!
    self.favourite = true
    self.save!
  end

  def unfavourite!
    self.favourite = false
    self.save!
  end
end
