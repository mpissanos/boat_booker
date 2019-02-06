class TripsController < ApplicationController
    
  def index
    @trips = Trip.all
  end

  def new
    @trip = current_user.Trip.build
  end

  def create
    @trip = current_user.Trip.build(trip_params)
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
    :passenger)
  end

end