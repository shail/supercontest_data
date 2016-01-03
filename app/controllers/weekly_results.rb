class WeeklyResultsController < ApplicationController
  def index
    render json: WeeklyResult.all
  end

  def show
    render json: WeeklyResult.find(params[:id])
  end
end
