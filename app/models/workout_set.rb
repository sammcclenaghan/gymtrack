class WorkoutSet < ApplicationRecord
  before_create {self.set_number = 1}
  
  belongs_to :workout_exercise

end
