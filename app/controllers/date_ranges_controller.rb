class DateRangesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @date_range = DateRange.new(date_range_params)
    @date_range.trip = Trip.find(params[:trip_id])
    authorize @date_range
    if @date_range.save
      redirect_to trip_path(@date_range.trip)
    else
      render 'trips/show'
    end
  end

  private

  def date_range_params
    params.require(:date_range).permit(:start_date, :end_date)
  end
end
