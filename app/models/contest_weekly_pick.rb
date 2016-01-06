class ContestWeeklyPick < ActiveRecord::Base
  include Filterable
  belongs_to :team
  scope :team_id, -> (team_id) { where team_id: team_id }
  validates :team_id, uniqueness: { scope: [:week, :team],
    message: "For a single week a team should only selected a team once" }
  enum team: { ne: 0, nyj: 1, mia: 2, buf: 3, pit: 4, bal: 5, cle: 6, cin: 7, hou: 8, ind: 9, jax: 10, ten: 11,
               den: 12, kc: 13, sd: 14, oak: 15, dal: 16, was: 17, nyg: 18, phi: 19, min: 20, gb: 21, det: 22,
               chi: 23, no: 24, tb: 25, atl: 26, car: 27, sf: 28, sea: 29, ari: 30, stl: 31 }
end
