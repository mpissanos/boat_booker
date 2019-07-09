module Api
  module V1
    class TripsController < BaseApiController
      
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_trip, only: [:destroy, :edit, :show, :update]

        
      def index
        @trips = Trip.all
        @trip = @user.trips.build
        @client = @trip.build_client
        @boats = Boat.all
        @boat = Boat.new
        render json: @trips
      end

      def new
        @trip = @user.trips.build
        @client = @trip.build_client
        render json: @trip
      end

      def create
        @trip = @user.trips.create(trip_params)
        render json: @trip
      end

      def show
        @client = @trip.client
        render json: @trip
      end
        
      def update
        if @trip.update_attributes(trip_params)
          render json: @trip
        else
          render json: @trip.errors, status: :unproccesable_entity
        end
      end
        
      def destroy
        @trip.destroy
        if @trip.destroy 
          head :no_content, status: :ok
        else
          render json: @trip.errors, status: :unproccesable_entity
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
  end
end