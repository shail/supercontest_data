class CreateTeamStandings < ActiveRecord::Migration
  def change
    create_table :team_standings do |t|
      t.integer :team_id, null: false
      t.integer :win, null: false
      t.integer :loss, null: false
      t.integer :tie, null: false
      t.decimal :pts, null: false
    end
    add_foreign_key :team_standings, :teams
  end
end
