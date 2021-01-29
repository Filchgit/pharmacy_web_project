require 'colorize'
require_relative './repositories/employee_repo.rb'
require_relative './repositories/customer_repo.rb'
require_relative './controllers/sessions_controller.rb'
require 'pry-byebug'


class Router
  def initialize(sessions_controller, customer_controller)
    # @sessions_controller = attributes[:sessions_controller]
    # this bit is for page by page testing only will move up later
     @sessions_controller = sessions_controller
     @customer_controller =  customer_controller

    @running = true
  end

  # this is the class that really seems a bit dodgy to me, maybe it is trying to say what 
  # Ruby on Rail is doing under the surface
  def run
    # we are going this as a method of a Router instance so we can bundle our
    # controller attributes I guess is the point 
    while @running
      puts 'Ok, so we are using the Router !'.blue 
      @currentuser = @sessions_controller.login      
      route_employee_actions if @currentuser.class == Employee 
      route_customer_actions if @currentuser.class == Customer
      route_new_user_actions if @currentuser == "new"
    end  
  end

   def route_employee_actions
     puts "-------------------------".light_blue
     puts " Employee actions here   ".light_blue 
    input = gets.chomp
   end
   
   def route_customer_actions
    puts "-------------------------".light_green
    puts " Customer actions here   ".light_green 
    input = gets.chomp
   end

   def route_new_user_actions
    puts "-------------------------".light_red
    puts " New User actions here   ".light_red 
    puts "-------------------------".light_red  
    # TODO customers_controller.add_new
    @customer_controller.add
     route_customer_actions
   end

end

# EMPLOYEE_CSV_FILE = File.join(__dir__, './data/employee_repo.csv')
# employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)

# CUSTOMER_CSV_FILE = File.join(__dir__, './data/customer_repo.csv')
# customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)

# sessions_controller = SessionsController.new(employee_repository, customer_repository)

# my_router = Router.new(sessions_controller)

#  my_router.run
