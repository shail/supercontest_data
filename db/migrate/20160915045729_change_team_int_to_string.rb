class ChangeTeamIntToString < ActiveRecord::Migration
  def change
    change_column :contest_weekly_picks, :team, :string
  end
end
