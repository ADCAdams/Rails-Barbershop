class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
        @appointment.build_barber
    end


end
