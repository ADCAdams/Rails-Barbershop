class CustomersController < ApplicationController


    def new
        @customer = Customer.new
    end


    def create
        binding.pry
        @customer = Customer.create(customer_params)
        if @customer.save
            session[:user_id] = @user.user_id
            redirect_to customer_path(@customer)
        else
            render :new
        end
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
