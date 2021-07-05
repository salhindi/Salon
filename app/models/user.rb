class User < ApplicationRecord
    validates :name, :username, :email, :salon_name, :name, presence: :true
    validates :username, :email,  uniqueness: :true
  

    has_secure_password

    
    has_many :appointments, through: :stylists
    has_many :stylists
    has_many :clients

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.name = auth.info.name 
            user.username = auth.info.name
          user.email = auth.info.email
          user.salon_name = auth.info.first_name
          user.password = SecureRandom.hex
          user.save!
        end
      end

end
