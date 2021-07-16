module StylistsHelper
    def stylist_name
        @stylist.name.titleize
    end
    
    def stylist_number
        number_to_phone(@stylist.phone_number)
    end

    # def stylist_appts
    #     @stylist.each do |stylist|
    #         stylist.appointments
    #             # appt.day
    #     end
            
    # end
end
