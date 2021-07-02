module ClientsHelper
    def client_number
        number_to_phone(@client.phone_number)
    end

    def client_name
        @client.name.titleize
    end
end
