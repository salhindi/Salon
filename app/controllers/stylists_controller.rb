class StylistsController < ApplicationController
    def index
        @stylist = Stylist.all
    end

    def new
        if !logged_in?
            redirect_to login_path
        else
        @stylist = Stylist.new
        end
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
        if !logged_in?
            redirect_to login_path
        else
        @stylist = Stylist.find(params[:id])   
        end
    end

    private

    def stylist_params
        params.require(:stylist).permit(:name, :phone_number, :yrs_experience)
    end

end
