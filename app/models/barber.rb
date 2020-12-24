class Barber < ApplicationRecord
    has_many :appointments
    has_many :customers, through: :appointments

    validates :name, uniqueness: true, presence: true 
    validates :name, format: { with: /\A[a-zA-Z\s]*\z/, message: "only allows letters and spaces" }
    validates :name, length: { minimum: 2 }
    validates :name, length: { maximum: 20 }
end