class TeamStanding < ActiveRecord::Base
  scope :team_id, -> (team_id) { where team_id: team_id }
end
