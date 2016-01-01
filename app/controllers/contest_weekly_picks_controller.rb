class ContestWeeklyPicksController < ApplicationController
  def index
    render json: ContestWeeklyPick.all
  end

  def show
    render json: ContestWeeklyPick.find(params[:id])
  end

  def search
    render json: ContestWeeklyPick.where(search_params)
  end

  private

  def search_params
    params.permit(:team_id)
  end
end
