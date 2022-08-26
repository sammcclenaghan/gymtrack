require "application_system_test_case"

class WorkoutExercisesTest < ApplicationSystemTestCase
  setup do
    @workout_exercise = workout_exercises(:one)
  end

  test "visiting the index" do
    visit workout_exercises_url
    assert_selector "h1", text: "Workout exercises"
  end

  test "should create workout exercise" do
    visit workout_exercises_url
    click_on "New workout exercise"

    fill_in "Exercise", with: @workout_exercise.exercise_id
    fill_in "Workout", with: @workout_exercise.workout_id
    click_on "Create Workout exercise"

    assert_text "Workout exercise was successfully created"
    click_on "Back"
  end

  test "should update Workout exercise" do
    visit workout_exercise_url(@workout_exercise)
    click_on "Edit this workout exercise", match: :first

    fill_in "Exercise", with: @workout_exercise.exercise_id
    fill_in "Workout", with: @workout_exercise.workout_id
    click_on "Update Workout exercise"

    assert_text "Workout exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Workout exercise" do
    visit workout_exercise_url(@workout_exercise)
    click_on "Destroy this workout exercise", match: :first

    assert_text "Workout exercise was successfully destroyed"
  end
end
