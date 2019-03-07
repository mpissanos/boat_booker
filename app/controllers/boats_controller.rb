class BoatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
 

  def index
    @boats = @user.boats

  end

  def new 
    @boat = Boat.new
  end

  def show
    respond_to do |format|
      format.html { render :show  }
      format.json {render json: @boat}
    end
  end

  def create
    @boat = @user.boats.create(boat_params)
    render json: @boat, status: 201
  end

  def edit
    if @boat.user != @user
      redirect_to boats_path
    end
  end

  def update
      @boat.update_attributes(boat_params)
      redirect_to boat_path(@boat)
  end
  
  private

  def boat_params
    params.require(:boat).permit( :boat_type, :name, :capacity)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
  
  def set_user
    @user = current_user
  end

end