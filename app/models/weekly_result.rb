class WeeklyResult < ActiveRecord::Base
  include Filterable
  scope :team_id, -> (team_id) { where team_id: team_id }
  validates :team_id, uniqueness: { scope: :week,
    message: "A team should have only one row for a given week" }
end
