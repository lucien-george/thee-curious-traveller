class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:edit, :update, :destroy]

  def create
    @activity = Activity.new(activity_params)
    @activity.trip = Trip.find(params[:trip_id])
    authorize @activity
    if @activity.save
      redirect_to trip_path(@activity.trip)
    else
      render 'trips/show'
    end
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    if @activity.save
      redirect_to trip_path(@activity.trip)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to trip_path(@activity.trip)
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description)
  end

  def find_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end
end
