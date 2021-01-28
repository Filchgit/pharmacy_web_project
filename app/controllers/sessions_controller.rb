require 'colorize'
require_relative '../repositories/employee_repo'
require_relative '../repositories/customer_repo'
require_relative '../views/sessions_view'
require 'pry-byebug'
# this bit is for page by page testing only will move up later
EMPLOYEE_CSV_FILE = File.join(__dir__, '../data/employee_repo.csv')
employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)

CUSTOMER_CSV_FILE = File.join(__dir__, '../data/customer_repo.csv')
customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)



class SessionsController
  def initialize(employee_repository, customer_repository)
    @sessions_view = SessionsView.new
    @employee_repository = employee_repository
    @customer_repository = customer_repository 
  end

  def login 
    system 'clear'
    puts 'If you are a new customer please type \'new\' for username'.red
    # I would think that the username could be assumed from a cookie if we 
    # are talking about web interface
    username = @sessions_view.ask_user_for(:username)
    return 'new' if username == 'new'
    
    employee = @employee_repository.find_by_username(username)
    customer = @customer_repository.find_by_username(username) 
   
    password = @sessions_view.ask_user_for(:password)
    return employee if employee && employee.password == password
    return customer if customer && customer.password == password
    byebug  
    login
  end
end

session_controller = SessionsController.new(employee_repository, customer_repository)
session_controller.login

