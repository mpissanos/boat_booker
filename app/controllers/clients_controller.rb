class ClientsController < ApplicationController

def index
  @clients = Client.all
end

def new
  @client = Client.new
end

def create
  @trip = Trip.find(params[:trip_id])
  @client = @trip.clients.create(client_params)
  if @client.save
    flash[:success] = "Object successfully created"
    redirect_to @client
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end

def destroy
  @client = Client.find(params[:id])
  if @client.destroy
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

end