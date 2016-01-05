class WeeklyResultsController < ApplicationController
  def index
    render json: WeeklyResult.all
  end

  def show
    render json: WeeklyResult.find(params[:id])
  end

  def create
    render json: WeeklyResult.create(weekly_result_params)
  end

  def update
    @weekly_result = WeeklyResult.find(params[:id])
    @weekly_result.tap { |weekly_result| weekly_result.update!(weekly_result_params) }
    render json: @weekly_result
  end

  private

  def weekly_result_params
    params.require(:weekly_result).permit(:week, :team)
  end
end
