class Customer < ApplicationRecord
    has_many :appointments
    has_many :barbers, through: :appointments
end
