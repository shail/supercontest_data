class TeamStanding < ActiveRecord::Base
  include Filterable
  belongs_to :team
  scope :team_id, -> (team_id) { where team_id: team_id }
  validates :team_id, uniqueness: true
end
