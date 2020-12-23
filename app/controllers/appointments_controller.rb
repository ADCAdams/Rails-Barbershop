class AppointmentsController < ApplicationController

    def new
        @customer = Appointment.find_by_id(params[:customer_id])
        @appointment = Appointment.new
        @appointment.build_barber
    end

    def create
        @appointment = current_customer.appointments.build(appointment_params)
        #binding.pry
        @appointment.customer_id = session[:user_id]
        if @appointment.save
            redirect_to appointment_path(@appointment)
        else

            #flash[:message] = "#{@appointment.errors.full_messages.to_sentence}."
            render :new, :barber_id => nil
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
