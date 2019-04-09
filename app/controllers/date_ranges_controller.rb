class DateRangesController < ApplicationController
  before_action :find_date_range, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update
    @date_range.update(date_range_params)
    if @date_range.save
      redirect_to trip_path(@date_range.trip)
    else
      render :edit
    end
  end

  def destroy
    @date_range.destroy
    redirect_to trip_path(@date_range.trip)
  end

  private

  def date_range_params
    params.require(:date_range).permit(:start_date, :end_date)
  end

  def find_date_range
    @date_range = DateRange.find(params[:id])
    authorize @date_range
  end
end
