class SessionsController < ApplicationController


    def welcome

    end

    def new
   
    end

    def create
        #binding.pry
        @customer = Customer.find_by(username: params[:customer][:username])
        if @customer.try(:authenticate, params[:customer][:password])
            session[:user_id] = @customer.id
            redirect_to customer_path(@customer)
        else
            flash[:error] = "***Login error*** try again"
            redirect_to login_path
        end


    #     return redirect_to(controller: 'sessions',
    #                    action: 'new') if !params[:user_id] || params[:user_id].empty?
    # session[:user_id] = params[:user_id]
    # redirect_to '/'
    end



    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def create_with_fb
        customer = Customer.find_or_create_by(authID: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.password = 'password'
        end
        customer.save
        session[:user_id] = customer.id
        binding.pry
        redirect_to '/'

    end


    private

  def auth
    request.env['omniauth.auth']
  end



end
