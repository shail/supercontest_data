class WeeklyResult < ActiveRecord::Base
  validates :team, uniqueness: { scope: :week,
    message: "A team should have only one row for a given week" }
end
