class TeamsController < ApplicationController
  def index
    render json: Team.all
  end

  def show
    render json: Team.find(params[:id])
  end

  def create
    render json: Team.create(team_params)
  end

  def update
    @team = Team.find(params[:id])
    @team.tap { |team| team.update!(team_params) }
    render json: @team
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
