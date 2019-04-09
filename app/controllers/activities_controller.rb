class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @activity = Activity.new(activity_params)
    @activity.trip = Trip.find(params[:trip_id])
    if @activity.save
      redirect_to trip_path(@activity.trip)
    else
      render 'trips/show'
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :description)
  end
end
