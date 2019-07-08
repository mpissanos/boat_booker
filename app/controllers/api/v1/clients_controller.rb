module Api
  module V1
    class ClientsController < BaseApiController

      before_action :authenticate_user!
      before_action :set_client, only: [:show, :destroy, :edit, :update]

      def index
      @clients = Client.all
      render json: @clients
      end

      def new
        @client = Client.new
        render json: @client
      end

      def create
        @client = Client.create(client_params)
        if @client.save
          render json: @client
        else
          flash[:error] = "Something went wrong"
        end
      end

      def show
        render json: @client
      end

      def edit
        render json: @client
      end
      
    def update
        if @client.update_attributes(client_params)
            render json: @client
          else
            flash[:error] = "Something went wrong"
            render 'edit'
          end
      end


      def destroy
        if @client.destroy!
          flash[:success] = 'Object was successfully deleted.'
          redirect_to clients_url
        else
          flash[:error] = 'Something went wrong'
          redirect_to clients_url
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