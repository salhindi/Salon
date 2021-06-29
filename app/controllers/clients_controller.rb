class ClientsController < ApplicationController

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
    end

    private

    def client_params
        params.require(:client).permit(:name, :phone_number)
    end
end
