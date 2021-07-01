class Stylist < ApplicationRecord
    belongs_to :user 

    validates :name, :phone_number, :yrs_experience, presence: :true
    validates :phone_number,  uniqueness: :true

    has_many :appointments
    has_many :clients, through: :appointments
end
