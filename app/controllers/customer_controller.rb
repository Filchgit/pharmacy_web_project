require 'colorize'
 require_relative '../repositories/customer_repo'
require_relative '../views/customer_view'
require 'pry-byebug'

class CustomerController
  def initialize(customer_repository)
    @customer_view = CustomerView.new
    @customer_repo = customer_repository 
  end

  def add
    username = @customer_view.ask_user_for("username")
    password = @customer_view.ask_user_for("password")
    first_name = @customer_view.ask_user_for("first_name")
    last_name = @customer_view.ask_user_for("last_name")
    # etc etc actually in a website we would just have a bunch of boxes and they 
    # would fiull out only what they want 
    customer = Customer.new(username: username, password: password, first_name: first_name,
                           last_name: last_name)
    @customer_repo.create(customer)
    # would actually check to make sure that had enough details to go on but  . . .

  end

end