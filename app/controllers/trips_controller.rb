class TripsController < ApplicationController
before_action :authenticate_user!
before_action :set_user
before_action :set_trip, only: [:destroy, :edit, :show, :update]
    
  def index
    @trips = @user.trips.all
  end

  def new
    @trip = @user.trips.build
    @client = @trip.build_client
    @boats = Boat.all
  end

  def create
    @trip = @user.trips.create(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render 'trips/new'
    end
  end

  def show
    @client = @trip.client
  end

  def edit
    if @trip.user != current_user
      redirect_to trips_path
    end
  end
  
  def update
    if @trip.update_attributes(trip_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @trip
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  def destroy
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
    client_attributes: [:name, :email, :phone_number],
    )
  end

  def set_user
    @user = current_user
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end