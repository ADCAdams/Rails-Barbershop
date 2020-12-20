class Barber < ApplicationRecord
    has_many :appointments
    has_many :customers, through: :appointments

    validates :name, uniqueness: true, presence: true 
end
