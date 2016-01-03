class ContestWeeklyPicksController < ApplicationController
  def index
    @picks = ContestWeeklyPicks.all
    @picks = @picks.team_id(params[:team_id]) if params[:team_id].present?
    render json: @picks
  end

  def show
    render json: ContestWeeklyPick.find(params[:id])
  end
end
