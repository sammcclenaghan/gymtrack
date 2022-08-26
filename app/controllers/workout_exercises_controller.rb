class WorkoutExercisesController < ApplicationController
  before_action :set_workout_exercise, only: %i[ show edit update destroy ]

  # GET /workout_exercises or /workout_exercises.json
  def index
    @workout_exercises = WorkoutExercise.all
  end

  # GET /workout_exercises/1 or /workout_exercises/1.json
  def show
  end

  # GET /workout_exercises/new
  def new
    @workout_exercise = WorkoutExercise.new
  end

  # GET /workout_exercises/1/edit
  def edit
  end

  # POST /workout_exercises or /workout_exercises.json
  def create
    @workout_exercise = WorkoutExercise.new(workout_exercise_params)

    respond_to do |format|
      if @workout_exercise.save
        format.html { redirect_to workout_exercise_url(@workout_exercise), notice: "Workout exercise was successfully created." }
        format.json { render :show, status: :created, location: @workout_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_exercises/1 or /workout_exercises/1.json
  def update
    respond_to do |format|
      if @workout_exercise.update(workout_exercise_params)
        format.html { redirect_to workout_exercise_url(@workout_exercise), notice: "Workout exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @workout_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_exercises/1 or /workout_exercises/1.json
  def destroy
    @workout_exercise.destroy

    respond_to do |format|
      format.html { redirect_to workout_exercises_url, notice: "Workout exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout_exercise
      @workout_exercise = WorkoutExercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_exercise_params
      params.require(:workout_exercise).permit(:workout_id, :exercise_id)
    end
end
