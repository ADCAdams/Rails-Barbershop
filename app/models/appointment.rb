class Appointment < ApplicationRecord
  belongs_to :barber
  belongs_to :customer
end
