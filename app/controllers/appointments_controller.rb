class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
        @appointment.build_barber
    end

    def appointment_params
        params.require(:customer).permit(
          :appointment_datetime,
          :style,
          :barber_id,
          :customer_id
          payment_profiles_attributes: [ :cc_name, :cc_number ]
        )
    end
end
