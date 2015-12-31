class TeamStandingsController < ApplicationController
  def index
    @team_standings = TeamStanding.all
    render json: @team_standings
  end
end
