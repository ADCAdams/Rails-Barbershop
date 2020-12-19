class CustomersController < ApplicationController


    def new
        @customer = Customer.new
    end


    def create


    end

    def show

    end


    def customer_params
        params.require(:customer).permit(
          :username,
          :password,
          payment_profiles: [ :cc_name, :cc_number ]
        )
      end

end
