class ClientsController < ApplicationController
  before_action :require_login
  
  # GET '/clients/new'
  def new
    @client = Client.new
  end

  # POST '/clients'
  def create
  end

  # GET '/clients'
  def index
    @clients = Client.all
  end

  # GET '/clients/:id'
  def show
    @client = Client.find_by(id: params[:id])
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end
end
