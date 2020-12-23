class Appointment < ApplicationRecord
  belongs_to :barber
  belongs_to :customer

  accepts_nested_attributes_for :barber


  validate :appointment_datetime_cannot_be_in_the_past
  scope :order_by_appointment_datetime, -> {order(:appointment_datetime)}

  def appointment_datetime_cannot_be_in_the_past
    if appointment_datetime.present? && appointment_datetime < Date.today
      errors.add(:appointment_datetime, "can't be in the past")
    end
  end

end
