require 'csv'
require_relative '../models/employee'
require_relative '../base_repo'




employee_csv_file = File.join(__dir__, 'data/employee.csv')
# meals = MealRepository.new(meal_csv_file)