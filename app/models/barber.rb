class Barber < ApplicationRecord
    has_many :appointments
    has_many :customers, through: :appointments

    validates :name, uniqueness: true, presence: true 
    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
end
