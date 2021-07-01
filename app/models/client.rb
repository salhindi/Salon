class Client < ApplicationRecord
    belongs_to :user

    validates :name, :phone_number, presence: :true
    validates :phone_number,  uniqueness: :true

    has_many :appointments
    has_many :stylists, through: :appointments
end
