require "test_helper"

class WorkoutExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_exercise = workout_exercises(:one)
  end

  test "should get index" do
    get workout_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_workout_exercise_url
    assert_response :success
  end

  test "should create workout_exercise" do
    assert_difference("WorkoutExercise.count") do
      post workout_exercises_url, params: { workout_exercise: { exercise_id: @workout_exercise.exercise_id, workout_id: @workout_exercise.workout_id } }
    end

    assert_redirected_to workout_exercise_url(WorkoutExercise.last)
  end

  test "should show workout_exercise" do
    get workout_exercise_url(@workout_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_workout_exercise_url(@workout_exercise)
    assert_response :success
  end

  test "should update workout_exercise" do
    patch workout_exercise_url(@workout_exercise), params: { workout_exercise: { exercise_id: @workout_exercise.exercise_id, workout_id: @workout_exercise.workout_id } }
    assert_redirected_to workout_exercise_url(@workout_exercise)
  end

  test "should destroy workout_exercise" do
    assert_difference("WorkoutExercise.count", -1) do
      delete workout_exercise_url(@workout_exercise)
    end

    assert_redirected_to workout_exercises_url
  end
end
