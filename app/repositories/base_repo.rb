require 'csv'
require_relative '../models/person' 
require 'pry-byebug'
CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

class BaseRepo
  # I guess this repository convention is just like a standardized setp in rails
  # so everyone can easily see where the data is being stored and in what sort of DB
  # is in use and then just just abstract out how to access the data from base repo
  def initialize(csv_file)
    @file_path = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@file_path)
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_to_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
    # the above line is the same as the below two , find just gets the first value from
    # the array that satisfies the block
    # this_element = @elements.select { |element| element.id == id }
    # this_element[0]
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end
  

  private 

  def save_to_csv
    CSV.open(@file_path, 'wb') do |csv|
      csv << @elements.first.class.csv_headers
      @elements.each do |element|
        csv << element.to_array
      end
    end
  end

  def load_csv
    CSV.foreach(@file_path, CSV_OPTIONS) do |row|
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
      @elements << Person.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end
end


BASE_CSV_FILE = File.join(__dir__, '../data/base_repo.csv') 
 base_repository = BaseRepo.new(BASE_CSV_FILE)

# my_other_person = Person.new(first_name: "Larry", last_name: "Dover",  address_first_line: "12 Green Rd", suburb:
#                              "Heathcote", email: "Dingo222@gmail.com", username: "Larry1")
#   my_person = Person.new(first_name: "Sally", last_name: "Williamson",  address_first_line: "17 Numantia Rd",
#                           suburb: "Engadine", email: "Sally@gmail.com", username: "Sally1")
#  base_repository.create(my_other_person)
#  base_repository.create(my_person)

#  print base_repository.all
# # cool this all works to this step  !!
