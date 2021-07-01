class Appointment < ApplicationRecord
    belongs_to :client
    # belongs_to :user
    belongs_to :stylist

    validates :day, :services, :price, :length, :stylist_id, presence: :true
    validates_associated :client

    validate :stylist_appt_unique_date


    # accepts_nested_attributes_for :client

    def client_attributes=(client_params)
        {name: "Client"}
        Client.find_or_create_by(client_params)
        client_params[:name].empty? ? self.client : self.client = client
    end

    def start_time
        self.day
    end

    def stylist_appt_unique_date
        if Appointment.find_by(day: day, stylist_id: stylist_id)
            errors.add(:day, "The stylist is already assigned to this day")
        end
    end
end
