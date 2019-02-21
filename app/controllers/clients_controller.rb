class ClientsController < ApplicationController
before_action :set_client, only: [:show, :destroy]
def index
  @clients = Client.all
end

def new
  @client = Client.new
end

def create
  
  @client = Client.create(client_params)
  if @client.save!
    flash[:success] = "Object successfully created"
    redirect_to @client
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end

def show
  
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