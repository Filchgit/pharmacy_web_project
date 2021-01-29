require_relative './models/person'
require_relative './models/customer'
require_relative './models/employee'

require_relative './repositories/base_repo'
require_relative './repositories/customer_repo'
require_relative './repositories/employee_repo'

require_relative './controllers/sessions_controller'
require_relative './controllers/customer_controller'

require_relative 'router'

# EMPLOYEE_CSV_FILE = File.join(__dir__, '../data/employee_repo.csv')
# employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)

# CUSTOMER_CSV_FILE = File.join(__dir__, '../data/customer_repo.csv')
# customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)

EMPLOYEE_CSV_FILE = File.join(__dir__, './data/employee_repo.csv')
employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)

CUSTOMER_CSV_FILE = File.join(__dir__, './data/customer_repo.csv')
customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)

sessions_controller = SessionsController.new(employee_repository, customer_repository)
customer_controller = CustomerController.new(customer_repository)

my_router = Router.new(sessions_controller,customer_controller )

 my_router.run
