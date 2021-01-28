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
end


CUSTOMER_CSV_FILE = File.join(__dir__, '../data/customer_repo.csv')
customer_repository = CustomerRepo.new(CUSTOMER_CSV_FILE)

my_customer = Customer.new(first_name: "janice", last_name: "Latrobe", suburb: "Glenelg", posts_read: 13 )
customer_repository.create(my_customer)
