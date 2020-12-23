class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  helper_method :current_customer

  def current_customer
    @customer = Customer.find_by(id: session[:user_id])
  end
  
end
