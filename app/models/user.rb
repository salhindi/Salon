class User < ApplicationRecord
    validates :name, :username, :email, presence: :true
    validates :username, :email,  uniqueness: :true


    has_secure_password

    
    has_many :appointments
    has_many :stylists
    has_many :clients
end
