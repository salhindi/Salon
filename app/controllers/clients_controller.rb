class ClientsController < ApplicationController
    before_action :require_login


    def index
        @client = Client.all.alphabetical.where(user_id: current_user.id)
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
        if @client.user_id = current_user.id
            @client = Client.find(params[:id])
        end
    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        @client = Client.find_by_id(params[:id])
        if @client.update(client_params)
            redirect_to client_path(@client)
        else
            render :edit 
        end
    end

    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to root_path
    end

    private

    def client_params
        params.require(:client).permit(:name, :phone_number, :user_id)
    end
end
