json.extract! workout_set, :id, :workout_exercise_id, :set_number, :weight, :reps, :created_at, :updated_at
json.url workout_set_url(workout_set, format: :json)
