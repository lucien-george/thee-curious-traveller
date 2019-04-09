class BreakdownsController < ApplicationController
  before_action :find_breakdown, only: [:edit, :update, :destroy]

  def new
    @breakdown = Breakdown.new
    authorize @breakdown
    @activity = Activity.find(params[:activity_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @breakdown = Breakdown.new(breakdown_params)
    @breakdown.activity = Activity.find(params[:activity_id])
    authorize @breakdown
    if @breakdown.save
      redirect_to trip_path(@breakdown.activity.trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @breakdown.update(breakdown_params)
    if @breakdown.save
      redirect_to trip_path(@breakdown.activity.trip)
    else
      render :edit
    end
  end

  def destroy
    @breakdown.destroy
    redirect_to trip_path(@breakdown.activity.trip)
  end

  private

  def breakdown_params
    params.require(:breakdown).permit(:description)
  end

  def find_breakdown
    @breakdown = Breakdown.find(params[:id])
    authorize @breakdown
  end
end
