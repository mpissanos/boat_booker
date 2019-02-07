class TripsController < ApplicationController
before_action :authenticate_user!
# before_action :set_user
    
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trip.build_client
  end

  def create
    @trip = current_user.trips.build(params[:id])
    
    if @trip.save
      redirect_to new_trip_path
    else
      render 'new'
    end
  end

  def show
    @trip = Trip.find(params[:trip_id])
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
    :passengers,
    client_attributes: [:name, :email, :phone_number]
    )
  end

end