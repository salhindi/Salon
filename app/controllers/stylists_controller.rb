class StylistsController < ApplicationController
    before_action :require_login

    def index
        @stylist = Stylist.all
    end

    def new
        @stylist = Stylist.new
    end

    def create
        @stylist = current_user.stylists.build(stylist_params)    
        if @stylist.save
            redirect_to stylist_path(@stylist)
        else
            render :new
        end
    end

    def show
        @stylist = Stylist.find(params[:id])   
    end

    private

    def stylist_params
        params.require(:stylist).permit(:name, :phone_number, :yrs_experience)
    end

end
