module Api
  module V1
    class ClientsController < BaseApiController

      # before_action :authenticate_user!
      before_action :set_client, only: [:show, :destroy, :edit, :update]

      def index
        @clients = Client.all
        render json: @clients
      end
       
      def show
        render json: @client
      end

      def create
        @client = Client.create(client_params)
        if @client.save
          render json: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end
      
      def update
        if @client.update_attributes(client_params)
          render json: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @client.destroy
        if @client.destroy
          head :no_content, status: :ok
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end


      private

        def client_params
          params.require(:client).permit(:name, :email, :phone_number)
        end

        def set_client
          @client = Client.find(params[:id])
        end
      end
    end
  end
end