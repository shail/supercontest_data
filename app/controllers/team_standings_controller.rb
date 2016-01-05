class TeamStandingsController < ApplicationController
  def index
    render json: TeamStanding.filter(params.slice(:team_id))
  end

  def show
    render json: TeamStanding.find(params[:id])
  end

  def create
    render json: TeamStanding.create(team_standings_params)
  end

  def update
    @team_standings = TeamStanding.find(params[:id])
    @team_standings.tap { |team| team.update!(team_standings_params) }
    render json: @team_standings
  end

  private

  def team_standings_params
    params.require(:team_standing).permit(:win, :loss, :tie, :pts, :team_id)
  end
end
