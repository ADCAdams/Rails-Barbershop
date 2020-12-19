class Customer < ApplicationRecord
    has_many :appointments
    has_many :payment_profiles
    has_many :barbers, through: :appointments
    accepts_nested_attributes_for :payment_profiles
end
