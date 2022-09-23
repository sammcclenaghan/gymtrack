class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts or /workouts.json
  def index
    @workouts = current_user.workouts.ordered
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    @workout_exercises = @workout.workout_exercises.ordered
  end

  # GET /workouts/new
  def new
    @workout = current_user.workouts.build
    @workout.starts_at = DateTime.now

  end

  # GET /workouts/1/edit
  def edit
  end

  def clone
    @old_workout = Workout.find(params[:id])
    @workout = Workout.from_workout(@old_workout)
    # @workout.workout_exercises << @old_workout.workout_exercises
    @old_workout.workout_exercises.each do |we|
     @workout.workout_exercises.create(exercise_id: we.exercise_id)
    end
    respond_to do |format|
      format.html { redirect_to workout_url(@workout), notice: "Cloned workout succesfully" }
    end
  end

  # POST /workouts or /workouts.json
  def create
    @workout = current_user.workouts.build(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to workout_url(@workout), notice: "Workout was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Workout was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to workouts_url, notice: "Workout was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Workout was successfully updated."}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to workouts_url, notice: "Workout was successfully destroyed." }
      format.turbo_stream {flash.now[:notice] = "Workout was successfully destroyed."}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :starts_at, :favourite, :user_id)
    end
end
