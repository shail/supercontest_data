# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151227191206) do

  create_table "team_standings", force: :cascade do |t|
    t.integer "team_id", limit: 4,                null: false
    t.integer "win",     limit: 4,                null: false
    t.integer "loss",    limit: 4,                null: false
    t.integer "tie",     limit: 4,                null: false
    t.decimal "pts",               precision: 10, null: false
  end

  add_index "team_standings", ["team_id"], name: "fk_rails_11c6a329d4", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string "name", limit: 255
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  add_foreign_key "team_standings", "teams"
end
