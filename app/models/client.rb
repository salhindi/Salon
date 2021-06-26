class Client < ApplicationRecord
    belongs_to :user
    has_many :appointments
    has_many :stylists, through: :appointments
end
