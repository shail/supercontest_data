class RenameActualWeeklyPicksToWeeklyResults < ActiveRecord::Migration
  def change
    rename_table :actual_weekly_picks, :weekly_results
  end
end
