require 'csv'
require_relative '../models/person' 

class BaseRepo

  # I guess this repository convention is just like a standardized setp in rails
  # so everyone can easily see where the data is being stored and in what sort of DB
  # is in use and then just just abstract out how to access the data from base repo
  def initialize(csv_file)
    @file_path = csv_file
    @elements = []
    @next_id = 1
    
   # load_csv if File.exist?(@file_path)
  end

  def save_to_csv
    CSV.open(@file_path, 'wb') do |csv|
      csv << @elements.first.class.csv_headers
      # csv << Meal.csv_headers
      @elements.each do |element|
        csv << element.to_array
      end
    end
  end
 
end

CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }
BASE_CSV_FILE = File.join(__dir__, 'data/base_repo.csv') 
base_repository = BaseRepo.new(BASE_CSV_FILE)

p base_repository