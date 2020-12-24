class Customer < ApplicationRecord
    has_many :appointments
    has_many :payment_profiles
    has_many :barbers, through: :appointments
    accepts_nested_attributes_for :payment_profiles

    validates :username, uniqueness: true, presence: true 
    validates :username, length: { minimum: 2 }
    validates :username, length: { maximum: 30 }

    has_secure_password


    


end
