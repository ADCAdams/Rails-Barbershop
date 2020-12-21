class BarbersController < ApplicationController


    def show
        @barber = Barber.find_by_id(params[:id])
        redirect_to '/' if !@barber
    end

    def index
        @barbers = Barber.all 
    end
    
end
