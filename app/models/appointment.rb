class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :user

    accepts_nested_attributes_for :client
end
