class ContestWeeklyResultsController < ApplicationController
  def index
    render json: ContestWeeklyResult.filter(params.slice(:team_id))
  end

  def show
    render json: ContestWeeklyResult.find(params[:id])
  end

  def create
    render json: ContestWeeklyResult.create(contest_weekly_result_params)
  end

  def update
    @contest_weekly_result = ContestWeeklyResult.find(params[:id])
    @contest_weekly_result.tap { |team| team.update!(contest_weekly_result_params) }
    render json: @contest_weekly_result
  end

  private

  def contest_weekly_result_params
    params.require(:contest_weekly_result).permit(:week, :team_id, :win, :loss, :tie, :pts)
  end
end
