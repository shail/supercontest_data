class FixPtsPrecision < ActiveRecord::Migration
  def change
    change_column :contest_weekly_results, :pts, :decimal, :precision => 5, :scale => 1
    change_column :team_standings, :pts, :decimal, :precision => 5, :scale => 1
  end
end
