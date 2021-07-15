class Stylist < ApplicationRecord
    # belongs_to :user 

    validates :name, :phone_number, :yrs_experience, presence: :true
    validates :phone_number,  uniqueness: :true

    validates_length_of :phone_number, is: 10


    has_many :appointments
    has_many :clients, through: :appointments

    scope :alphabetical, -> { Stylist.order("name ASC") }
end
