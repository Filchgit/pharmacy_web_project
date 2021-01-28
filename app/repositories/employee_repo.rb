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
end


EMPLOYEE_CSV_FILE = File.join(__dir__, '../data/employee_repo.csv')
employee_repository = EmployeeRepo.new(EMPLOYEE_CSV_FILE)



