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
    
  end

  def create
    @boat = @user.boats.create(boat_params)
    if @boat.save!
      flash[:success] = "Object successfully created"
      redirect_to boat_path(@boat)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    if @boat.user != @user
      redirect_to boats_path
    end
  end

  def update
    if @boat.update_attributes(boat_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @boat
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
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