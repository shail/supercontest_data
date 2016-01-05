class ContestWeeklyPicksController < ApplicationController
  def index
    render json: ContestWeeklyPick.filter(params.slice(:team_id))
  end

  def show
    render json: ContestWeeklyPick.find(params[:id])
  end

  def create
    render json: ContestWeeklyPick.create(contest_weekly_pick_params)
  end

  def update
    @contest_weekly_pick = ContestWeeklyPick.find(params[:id])
    @contest_weekly_pick.tap { |contest_weekly_pick| contest_weekly_pick.update!(contest_weekly_pick_params) }
    render json: @contest_weekly_pick
  end

  private

  def contest_weekly_pick_params
    params.require(:contest_weekly_pick).permit(:team_id, :week, :team)
  end

end
