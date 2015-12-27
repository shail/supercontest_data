class CreateContestWeeklyPicks < ActiveRecord::Migration
  def change
    create_table :contest_weekly_picks do |t|
      t.integer :team_id, null: false
      t.integer :week, null: false
      t.column :team, :integer, null: false
    end
    add_foreign_key :contest_weekly_picks, :teams
    add_index :contest_weekly_picks, [:team_id, :week]
  end
end
