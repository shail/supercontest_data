class CreateContestWeeklyResults < ActiveRecord::Migration
  def change
    create_table :contest_weekly_results do |t|
      t.integer :week, null: false
      t.integer :team_id, null: false
      t.integer :win, null: false
      t.integer :loss, null: false
      t.integer :tie, null: false
      t.integer :pts, null: false
    end
    add_foreign_key :contest_weekly_results, :teams
  end
end
