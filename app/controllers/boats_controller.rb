class BoatsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
 

  def index
    @boats = @user.boats.all
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @boats }
    end
  end

  def new 
    @boat = Boat.new
  end

  def show
    render json: @boat, status: 200 
  end


  def create
    @boat = @user.boats.create(boat_params)
    render json: @boat, status: 201
  end

  def edit
  end

  def update
      @boat.update(boat_params)
      redirect_to boats_path
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

  def find_trip
    set_boat
    @trip = Trip.where(boat_id: @boat).first
  end
  
  def set_user
    @user = current_user
  end

end