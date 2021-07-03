class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :stylist

    validates :day, :services, :price, :length, :stylist_id, presence: :true
    validates_associated :client

    validate :stylist_appt_unique_date, on: :create

    validate :appointment_cannot_be_in_the_past


     accepts_nested_attributes_for :client

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

    def show_date
        self.day.strftime("%B %d, %Y, %l:%M %p")
    end

    def appointment_cannot_be_in_the_past
        if day.present? && day < Date.today
          errors.add(:appointment, "can't be in the past")
        end
      end

    
end
