class TeamsController < ApplicationController
  def index
    render json: Team.all
  end

  def show
    render json: Team.find(params[:id])
  end

  def create
    Team.create(team_params)
  end

  def update
    Team.find(params[:id]).tap { |team| team.update!(team_params) }
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
