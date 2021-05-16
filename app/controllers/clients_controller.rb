class ClientsController < ApplicationController
  before_action :require_login

  # GET '/clients/new'
  def new
    @client = Client.new
  end

  # POST '/clients'
  def create
    @client = Client.find_or_initialize_by(name: client_params[:name]) #currently preventing duplicate names, not ideal
    if @client.save
      redirect_to client_path(@client)
    else
      render '/clients/new'
    end
  end

  # GET '/clients'
  def index
    @clients = Client.all
  end #refactor view logic to a class method?

  # GET '/clients/:id'
  def show
    @client = Client.find_by(id: params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end
end
