class ContestWeeklyResult < ActiveRecord::Base
  include Filterable
  belongs_to :team
  scope :team_id, -> (team_id) { where team_id: team_id }
  validates :team_id, uniqueness: { scope: :week.
    message: "A team should only have one weekly result for a week"}
end
