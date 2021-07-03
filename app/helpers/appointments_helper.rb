module AppointmentsHelper
    def appt_client_name
        @appointment.client.name.titleize
    end

    def appt_stylist_name
        @appointment.stylist.name.titleize
    end

    def appt_client_number
        number_to_phone(@appointment.client.phone_number)
    end

  
end
