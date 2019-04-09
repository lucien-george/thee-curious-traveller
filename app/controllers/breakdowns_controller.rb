class BreakdownsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @breakdown = Breakdown.new
    @activity = Activity.find(params[:activity_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @breakdown = Breakdown.new(breakdown_params)
    @breakdown.activity = Activity.find(params[:activity_id])
    if @breakdown.save
      redirect_to trip_path(@breakdown.activity.trip)
    else
      render :new
    end
  end

  private

  def breakdown_params
    params.require(:breakdown).permit(:description)
  end
end
