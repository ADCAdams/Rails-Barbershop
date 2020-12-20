class AppointmentsController < ApplicationController

    def new
        @appointment = Appointment.new
        @appointment.build_barber
    end

    def create
        @appointment = Appointment.create(appointment_params)
        #binding.pry
        @appointment.customer_id = session[:user_id]
        if @appointment.save
            binding.pry
            redirect_to appointment_path(@appointment)
        else
            render :new
        end
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
        redirect_to '/' if !@appointment
    end

    def index
        @appointments = Appointment.all 
    end



    private

    def appointment_params
        #binding.pry

        if params[:appointment][:barber_attributes][:name] == ""
            params.require(:appointment).permit(
                :appointment_datetime,
                :style,
                :barber_id,
                :customer_id)
        else

            params.require(:appointment).permit(
            :appointment_datetime,
            :style,
            :barber_id,
            :customer_id,
            barber_attributes: [ :name, :mustache ]
            )
        end

    end


end
