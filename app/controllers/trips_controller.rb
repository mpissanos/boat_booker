class TripsController < ApplicationController
before_action :authenticate_user!

    
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trip.build_client
  end

  def create
    @trip = @user.trip.create(trip_params)
    if @trip.save
      redirect_to @trip
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

  def set_user
    @user = User.find(params[:user_id])
  end

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