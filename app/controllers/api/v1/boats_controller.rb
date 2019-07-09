module Api
  module V1
    class BoatsController < BaseApiController
    
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_boat, only: [:show, :edit, :update, :destroy]
    before_action :set_boat_trips, only: [:show, :update, :edit]
  

      def index
        @boats = Boat.all
        @boat = Boat.new
        @trip = Trip.new
        render json: @boats
      end

      def show
        render json: @boat
      end


      def create
        @boat = @user.boats.new(boat_params)
        if @boat.save
          render json: @boat, status: :created
        else
          render json: @boat.errors, status: :unprocessable_entity
      end

      def update
        if @boat.update(boat_params)
        render json: @boat
        else
          render json: @boat.errors, status: :unprocessable_entity
      end

      def destroy
        @boat.destroy
        if @boat.destroy
          head :no_content, status: :ok
        else
          render json: @boat.errors, status: :unprocessable_entity
        end
      end
      
      private

      def boat_params
        params.require(:boat).permit( :boat_type, :name, :capacity, :avatar)
      end

      def set_boat
        @boat = Boat.find(params[:id])
      end

      def set_boat_trips
        @trips = @boat.trips.find_by(params[:boat_id])
        
      end
      
      def set_user
        @user = current_user
      end
    end
  end
end
  