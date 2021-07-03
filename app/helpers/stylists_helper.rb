module StylistsHelper
    def stylist_name
        @stylist.name.titleize
    end
    
    def stylist_number
        number_to_phone(@stylist.phone_number)
    end
end
