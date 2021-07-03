class ClientsController < ApplicationController
    before_action :require_login


    def index
        @client = Client.all.alphabetical
    end

    def new
        @client = Client.new
    end

    def create
        @client = current_user.clients.build(client_params)
        if @client.save
            redirect_to client_path(@client)
        else
            render :new
        end
    end

    def show
        @client = Client.find(params[:id])
    end

    def edit
        @client = Client.find_by(params[:id])
    end

    def update
        @client = Client.find_by_id(params[:id])
        if @client.update(client_params)
            redirect_to client_path(@client)
        else
            render :edit 
        end
    end

    private

    def client_params
        params.require(:client).permit(:name, :phone_number)
    end
end
