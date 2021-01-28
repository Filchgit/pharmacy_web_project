require 'csv'


class BaseRepo
  CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }
  # I guess this repository convention is just like a standardized setp in rails
  # so everyone can easily see where the data is being stored and in what sort of DB
  # is in use and then just just abstract out how to access the data from base repo
 
end

BASE_CSV_FILE = File.join(__dir__, 'data/base_repo.csv') 
base_repository = BaseRepo.new(BASE_CSV_FILE)
