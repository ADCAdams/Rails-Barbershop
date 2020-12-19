class CustomersController < ApplicationController


    def new
        @customer = Customer.new
        @customer.payment_profiles.build(cc_name: "")
        # @customer.payment_profiles.build(cc_name: "")
    end


    def create
        #binding.pry
        @customer = Customer.create(customer_params)
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to customer_path(@customer)
        else
            render :new
        end
    end



    def show
        @customer = Customer.find_by_id(params[:id])
    end


    def customer_params
        params.require(:customer).permit(
          :username,
          :password,
          payment_profiles_attributes: [ :cc_name, :cc_number ]
        )
      end

end
