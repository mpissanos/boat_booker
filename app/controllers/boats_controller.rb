class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :destroy, :edit]

  def index
    @boats = Boat.all
  end

  def new 
    @boat = Boat.new
  end

  def create
    @boat = Boat.create(boat_params)
    if @boat.save!
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
  en


  private

  def boat_params
    params.require(:boat).permit(:type, :name, :capacity)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def set_user
    @user = current_user
  end

end