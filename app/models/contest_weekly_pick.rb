class ContestWeeklyPick < ActiveRecord::Base
  include Filterable
  scope :team_id, -> (team_id) { where team_id: team_id }
end
