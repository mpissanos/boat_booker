class TripsController < ApplicationController
before_action :authenticate_user!
before_action :set_user
    
  def index
    @trips = @user.trips.all
  end

  def new
    @trip = @user.trips.build
    @client = @trip.build_client
    

  end

  def create
    @trip = @user.trips.create(trip_params)
    if @trip.save
      redirect_to trips_path(@trip)
    else
      render 'trips/new'
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @client = @trip.client
  end

  def edit
    @trip = Trip.find(params[:id])
  end
  
  def update
    @trip = Trip.find(params[:id])
      if @trip.update_attributes(trip_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @trip
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    if @trip.destroy 
      flash[:success] = 'Object was successfully deleted.'
      redirect_to trips_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to trips_url
    end
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