class ContestWeeklyPick < ActiveRecord::Base
  include Filterable
  belongs_to :team
  scope :team_id, -> (team_id) { where team_id: team_id }
  validates :team_id, uniqueness: { scope: [:week, :team],
    message: "For a single week a team should only selected a team once" }
end
