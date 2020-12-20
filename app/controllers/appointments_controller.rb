class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
    end


end
