class TripsController < ApplicationController
  before_action :find_trip, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!
  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    date_ranges = params[:trip][:date_ranges]
    if @trip.save
      DateRange.create(trip: @trip, start_date: Date.parse(date_ranges[:start_date].split('to')[0]), end_date: Date.parse(date_ranges[:end_date]))
      @trip.update(sku: "TRIP#{@trip.id}")
      params[:trip][:photos][:url]&.each do |url|
        @trip.photos.create(url: url)
      end
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:title, :description, :destination, :price)
  end
end
