class CreateActualWeeklyPicks < ActiveRecord::Migration
  def change
    create_table :actual_weekly_picks do |t|
      t.integer :week, null: false
      t.column :team, :integer, null: false
    end
    add_index :actual_weekly_picks, :week
  end
end
