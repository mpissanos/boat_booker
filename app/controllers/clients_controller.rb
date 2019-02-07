class ClientsController < ApplicationController

def index
  @clients = Client.all
end

def new
  @client = 
end

def create

end


end