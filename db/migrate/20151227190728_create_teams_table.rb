class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
    end
    add_index :teams, :name
  end
end
