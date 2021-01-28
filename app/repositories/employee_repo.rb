require 'csv'
require_relative '../models/employee'
require_relative './base_repo'
require 'pry-byebug'

class EmployeeRepo < BaseRepo
  def initialize(csv_file)
    super
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_to_csv
  end

private

  def load_csv
    CSV.foreach(@file_path, CSV_OPTIONS) do |row|
      # That CSV_OPTIONS which we loaded in as a global variable is COOOL 
      # means we load the CSV rows in as a hash, with the headers 
      #  serving as keys symbols for their columns !!
      # better be a similiar thing for DBs!!!
      # they still come in as string so need to convert as appropriate
      # I imagine this is a good point to apply regex for phone numbers etc to prevent bad 
      # data being loaded in from friegn generated csv's
      row[:id] = row[:id].to_i 
      row[:first_name] = row[:first_name]
      row[:last_name] = row[:last_name]
      row[:address_first_line] = row[:address_first_line]
      row[:address_second_line] = row[:address_second_line]
      row[:suburb] = row[:suburb]
      row[:postcode] = row[:postcode].to_i
      row[:phone_number] = row[:phone_number].to_i
      row[:email] = row[:email]
      row[:security_level] = row[:security_level]
      row[:password] = row[:password]
      @elements << Employee.new(row)
    end
    @next_id = @elements.last.id.to_i + 1 unless @elements.empty?
  end
end


EMPLOYEE_CSV_FILE = File.join(__dir__, '../data/employee_repo.csv')
employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)

#  my_employee = Employee.new(first_name: "Karly", last_name: "Smith", suburb: "Bondi", security_level: 1, password: "secret")
#  my_sec_employee  =  Employee.new(first_name: "Roger", last_name: "Downs", suburb: "Waverley", security_level: 2, password: "big secret")
#  employee_repository.create(my_employee)
#  employee_repository.create(my_sec_employee)

byebug
 print "done check it out !"
