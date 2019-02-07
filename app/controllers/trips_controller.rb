class TripsController < ApplicationController
    
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new(trip_params)
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def delete
  end

  private

  def trip_params
    params.require(:trip).permit(
    :trip_time,
    :location,
    :trip_length,
    :boat_type,
    :price,
    :passengers)
  end

end