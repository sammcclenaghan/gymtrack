class AddFavouriteToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :favourite, :boolean, default: false
  end
end
