class ClientsController < ApplicationController

    def index
        if !logged_in?
            redirect_to login_path
        else
            @client = Client.all
        end
    end

    def new
        if !logged_in?
            redirect_to login_path
        else
            @client = Client.new
        end
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
        if !logged_in?
            redirect_to login_path
        else
        @client = Client.find(params[:id])
        end
    end

    private

    def client_params
        params.require(:client).permit(:name, :phone_number)
    end
end
