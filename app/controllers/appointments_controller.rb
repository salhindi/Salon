class AppointmentsController < ApplicationController
    def index
        if same_client
        # Scope your query to the dates being shownn
            start_date = params.fetch(:start_date, Date.today).to_date
            @appointments = @client.appointments.where(day: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
        else
            start_date = params.fetch(:start_date, Date.today).to_date
            @appointments = Appointment.where(day: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

        end
      end
      

    def new
        if same_client
            @appointment = @client.appointments.build 
        else
            @appointment = Appointment.new
            @client = @appointment.build_client
        end
    end

    def create
        if same_client
            @appointment = @client.appointments.build
        else
            @appointment = Appointment.new(appt_params)
        end

        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
    
            redirect_to new_appointment_path(@appointment), alert: "#{@appointment.errors.full_messages}"
        end
    end
    
    def show 
        @appointment = Appointment.find(params[:id])
    end

    private

    def appt_params
        params.require(:appointment).permit(:day, :services, :price, :length, :stylist_id, :client_id, client_attributes:[:name, :phone_number, :user_id])
    end

    def same_client
        params[:client_id] && @client = Client.find_by_id(params[:client_id])
    end
end
