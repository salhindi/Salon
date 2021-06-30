class Appointment < ApplicationRecord
    belongs_to :client
    # belongs_to :user
    belongs_to :stylist

    # accepts_nested_attributes_for :client

    def client_attributes=(client_params)
        {name: "Client"}
        Client.find_or_create_by(client_params)
        client_params[:name].empty? ? self.client : self.client = client
    end

    def start_time
        self.day
    end
end
