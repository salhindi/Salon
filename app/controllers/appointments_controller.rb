class AppointmentsController < ApplicationController
    def index
        if params[:client_id] && @client = Client.find_by_id(params[:client_id])
        # Scope your query to the dates being shown:
            Client.find_by(id: params[:client_id])
        start_date = params.fetch(:start_date, Date.today).to_date
        @appointments = Appointment.where(day: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
      end
      

    def new
        if params[:client_id] && @client = Client.find_by_id(params[:client_id])
            @appointment = @client.appointments.build 
        else
            @appointment = Appointment.new
            @appointment.build_client
        end
    end

    def create
        if params[:client_id] && @client = Client.find_by_id(params[:client_id])
            @appointment = @client.appointments.build
        else
            @appointment = Appointment.new(appt_params)
        end
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render :new
        end
    end
    
    def show 
        @appointment = Appointment.find(params[:id])
    end

    private

    def appt_params
        params.require(:appointment).permit(:day, :services, :price, :length, :stylist_id, :client_id, client_attributes:[:name, :phone_number, :user_id])
    end
end
