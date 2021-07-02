class Client < ApplicationRecord
    belongs_to :user

    validates :name, :phone_number, presence: :true
    validates :phone_number,  uniqueness: :true

    validates_length_of :phone_number, is: 10
    validates :phone_number, numericality: true

    scope :alphabetical, -> { Client.order(name: :asc) }

    has_many :appointments
    has_many :stylists, through: :appointments
end
