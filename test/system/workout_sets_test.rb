require "application_system_test_case"

class WorkoutSetsTest < ApplicationSystemTestCase
  setup do
    @workout_set = workout_sets(:one)
  end

  test "visiting the index" do
    visit workout_sets_url
    assert_selector "h1", text: "Workout sets"
  end

  test "should create workout set" do
    visit workout_sets_url
    click_on "New workout set"

    fill_in "Reps", with: @workout_set.reps
    fill_in "Set number", with: @workout_set.set_number
    fill_in "Weight", with: @workout_set.weight
    fill_in "Workout exercise", with: @workout_set.workout_exercise_id
    click_on "Create Workout set"

    assert_text "Workout set was successfully created"
    click_on "Back"
  end

  test "should update Workout set" do
    visit workout_set_url(@workout_set)
    click_on "Edit this workout set", match: :first

    fill_in "Reps", with: @workout_set.reps
    fill_in "Set number", with: @workout_set.set_number
    fill_in "Weight", with: @workout_set.weight
    fill_in "Workout exercise", with: @workout_set.workout_exercise_id
    click_on "Update Workout set"

    assert_text "Workout set was successfully updated"
    click_on "Back"
  end

  test "should destroy Workout set" do
    visit workout_set_url(@workout_set)
    click_on "Destroy this workout set", match: :first

    assert_text "Workout set was successfully destroyed"
  end
end
