class TripsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_trip, only: [:destroy, :edit, :show, :update]

    
  def index
    @trips = Trip.all
    @trip = @user.trips.build
    @client = @trip.build_client
    @boats = Boat.all
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @trips }
    end
  end

  def new
    @trip = @user.trips.build
    @client = @trip.build_client
    @boats = Boat.all
  end

  def create
    @trip = @user.trips.create(trip_params)
    respond_to do |format|
      if @trip.save 
        format.html { redirect_to @trip, notice: 'Trip has been successfully created!'}
        format.js
        format.json { render json: @trip }
      else
        format.html { render 'new' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @client = @trip.client
    render json: @trip
    
  end

  def edit
    if @trip.user != current_user
      redirect_to trips_path
    else
      @boats = @user.boats
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
    :location,
    :price,
    :passengers,
    :date,
    :start_time,
    :end_time,
    :boat_id,
    client_attributes: [
        :name, 
        :email, 
        :phone_number
    ]
    )
  end

  def set_user
    @user = current_user
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end


end