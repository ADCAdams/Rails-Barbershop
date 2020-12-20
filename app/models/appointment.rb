class Appointment < ApplicationRecord
  belongs_to :barber
  belongs_to :customer

  accepts_nested_attributes_for :barber
end
