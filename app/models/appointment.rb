class Appointment < ApplicationRecord
  belongs_to :barber
  belongs_to :customer

  accepts_nested_attributes_for :barber



  scope :order_by_appointment_datetime, -> {order(:appointment_datetime)}
end
