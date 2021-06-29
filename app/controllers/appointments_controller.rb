class AppointmentsController < ApplicationController
    def new
        @appointment = Appointment.new
        @appointment.build_client
    end

    def create
    end
    
    def show 
    end
end
