require 'csv'
require_relative '../models/customer'
require_relative './base_repo'
require 'pry-byebug'

class CustomerRepo < BaseRepo
  def initialize(csv_file)
    super
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_to_csv
  end

  def load_csv
    CSV.foreach(@file_path, CSV_OPTIONS) do |row|
      # That CSV_OPTIONS which we loaded in as a global variable is COOOL
      # means we load the CSV rows in as a hash, with the headers
      #  serving as keys symbols for their columns !!
      # better be a similiar thing for DBs!!!
      # they still come in as string so need to convert as appropriate
      # I imagine this is a good point to apply regex for phone numbers etc to prevent bad
      # data being loaded in from foreign generated csv's
      row[:id] = row[:id].to_i 
      row[:first_name] = row[:first_name]
      row[:last_name] = row[:last_name]
      row[:address_first_line] = row[:address_first_line]
      row[:address_second_line] = row[:address_second_line]
      row[:suburb] = row[:suburb]
      row[:postcode] = row[:postcode].to_i
      row[:phone_number] = row[:phone_number].to_i
      row[:email] = row[:email]
      row[:username] = row[:username]
      row[:password] = row[:password]
      row[:posts_read] = row[:posts_read].to_i
      @elements << Customer.new(row)
    end
    @next_id = @elements.last.id.to_i + 1 unless @elements.empty?
  end
  
end

# # down here for in page testing moved back further as it gets more complete
# CUSTOMER_CSV_FILE = File.join(__dir__, '../data/customer_repo.csv')
# customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)


#  my_customer = Customer.new(first_name: "janice", last_name: "Latrobe", suburb: "Glenelg", posts_read: 13 ,
#                              username: "janice1", password: '1234')
#  customer_repository.create(my_customer)
