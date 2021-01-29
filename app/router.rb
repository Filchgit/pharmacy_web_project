require 'colorize'
require_relative './repositories/employee_repo.rb'
require_relative './repositories/customer_repo.rb'
require_relative './controllers/sessions_controller.rb'
require 'pry-byebug'


class Router
  def initialize(sessions_controller)
    # @sessions_controller = attributes[:sessions_controller]
    # this bit is for page by page testing only will move up later
     @sessions_controller = sessions_controller

    @running = true
  end

  # this is the class that really seems a bit dodgy to me, maybe it is trying to say what 
  # Ruby on Rail is doing under the surface
  def run
    # we are going this as a method of a Router instance so we can bundle our
    # controller attributes I guess is the point 
    puts 'Ok, so we are using the Router !'.blue 
    @currentuser = @sessions_controller.login
    puts "Made it and I am a employee".green if @currentuser.class == Employee
    puts "Made it back to router and I am a customer".yellow if @currentuser.class == Customer
    puts "New USER !!".red if @currentuser = "new"

    puts 'back here safely !'.red
    
  end
end

EMPLOYEE_CSV_FILE = File.join(__dir__, './data/employee_repo.csv')
employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)

CUSTOMER_CSV_FILE = File.join(__dir__, './data/customer_repo.csv')
customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)

sessions_controller = SessionsController.new(employee_repository, customer_repository)

my_router = Router.new(sessions_controller)

 my_router.run
