class AppointmentsController < ApplicationController
    before_action :require_login

    def index
        if same_stylist 
            start_date = params.fetch(:start_date, Date.today).to_date
            @appointments = @stylist.appointments.where(day: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week) 
        elsif same_client
            start_date = params.fetch(:start_date, Date.today).to_date
            @appointments = @client.appointments.where(day: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
        else 
            start_date = params.fetch(:start_date, Date.today).to_date
            @appointments = Appointment.where(day: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week, user_id: current_user.id)
        end
    end
      
    def new
        if same_stylist
            @appointment = @stylist.appointments.build 
        elsif same_client 
            @appointment = @client.appointments.build 
        else
            @appointment = Appointment.new
            @appointment.build_client
        end
    end

    def create
        if same_stylist
            @appointment = @stylist.appointments.build(appt_params) 
        elsif same_client
            @appointment = @client.appointments.build(appt_params)
        else
            @appointment = Appointment.new(appt_params.merge(user_id: current_user.id))
        end

        if @appointment.save
            redirect_to appointment_path(@appointment)
        else 
            render :new
        end
    end
    
    def show 
        @appointment = Appointment.find(params[:id])
        if @appointment.client.user_id != current_user.id

        flash[:alert]= 'Not your Client'
            redirect_to root_path
        else
            @appointment = Appointment.find(params[:id])
        end
    end

    def edit
        @appointment = Appointment.find(params[:id])
        
        if @appointment.client.user_id != current_user.id
            flash[:alert]= 'Not your Client'
            redirect_to edit_appointment_path(@appointment)
        else
            @appointment = Appointment.find(params[:id])
        end
    end

    def update
        @appointment = Appointment.find_by_id(params[:id])
        if @appointment.update(appt_params)
            redirect_to appointment_path(@appointment)
        else
            render :edit 
        end
    end

    def destroy
        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to root_path
    end

    private

    def appt_params
        params.require(:appointment).permit(:day, :services, :price, :length, :stylist_id, :user_id, :client_id, client_attributes:[:name, :phone_number, :user_id])
    end

    def same_client
        params[:client_id] && @client = Client.find_by_id(params[:client_id])
    end

    def same_stylist
        params[:stylist_id] && @stylist = Stylist.find_by_id(params[:stylist_id])
    end

end
