class AppointmentsController < ApplicationController

    def new
        @customer = Appointment.find_by_id(params[:customer_id])
        @appointment = Appointment.new
        @appointment.build_barber
    end

    def create
        binding.pry
        if current_customer && current_customer == session[:user_id]
            @appointment = current_customer.appointments.build(appointment_params)
            @appointment.customer_id = session[:user_id]
            if @appointment.save
                redirect_to appointment_path(@appointment)
            else
                #flash[:message] = "#{@appointment.errors.full_messages.to_sentence}."
                render :new
            end
        else
            redirect_to '/'
        end

    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
        redirect_to '/' if !@appointment
    end

    def index

        if params[:id].to_i == session[:user_id]     #if user is logged in

            @customer = Customer.find_by_id(params[:customer_id])
            @appointments = @customer.appointments.order_by_appointment_datetime
        elsif current_customer

            redirect_to customer_path(current_customer)
        else
            redirect_to '/' 
        end
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
