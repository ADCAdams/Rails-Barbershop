class CustomersController < ApplicationController


    def new
        @customer = Customer.new
    end
    
end
