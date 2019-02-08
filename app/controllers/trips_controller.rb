class TripsController < ApplicationController
before_action :authenticate_user!
before_action :set_user
    
  def index
    @trips = @user.trips
  end

  def new
    @trip = Trip.new
    @trip.build_client
  end

  def create
    @trip = @user.trips.build(trip_params)
    
    
    if @trip.save!
      redirect_to trips_path
    else
      render 'trips/new'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @client = @trip.client
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
    :date,
    client_attributes: [:name, :email, :phone_number]
    )
  end

  def set_user
    @user = current_user
  end

end