class BoatsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  before_action :set_trips, only: [:show, :update, :edit]
 

  def index
    @boats = Boat.all
    @boat = Boat.new
    @trip = Trip.new
    respond_to do |format|
      format.html 
      format.json { render json: @boats }
    end
  end

  def new 
    @boat = Boat.new
    @trip = Trip.new
    respond_to do |format|
      format.html { render 'new' }
    end
  end

  def show
    @boat = Boat.new
    respond_to do |format|
      format.html 
      format.json { render json: @boat }
    end
  end


  def create
    @boat = @user.boats.create(boat_params)
    respond_to do |format|
      format.json { render json: @boat, status: 201}
      format.js
      format.html
    end
  end

  def edit
  end

  def update
    @boat.update(boat_params)
      respond_to do |format|
        format.html { rediect_to boat_path @boat}
        format.json { render json: @boat}
      end
  end

  def destroy
    if @boat.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to boats_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to boats_url
    end
  end
  
  private

  def boat_params
    params.require(:boat).permit( :boat_type, :name, :capacity)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def set_trips
    @trips = @boat.trips.find_by(params[:boat_id])
    
  end
  
  def set_user
    @user = current_user
  end

end