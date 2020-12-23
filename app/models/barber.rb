class Barber < ApplicationRecord
    has_many :appointments
    has_many :customers, through: :appointments

    validates :name, uniqueness: true, presence: true 
    validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
