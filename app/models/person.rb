class Person
  attr_accessor :id, :first_name, :last_name, :address_first_line, :address_second_line, :suburb, :postcode, :phone_number,
                :email , :username, :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @address_first_line = attributes[:address_first_line]
    @address_second_line = attributes[:address_second_line]
    @suburb = attributes[:suburb]
    @postcode = attributes[:postcode]
    @phone_number = attributes[:phone_number]
    @email = attributes[:email]
    @username = attributes[:username]
    @password = attributes[:password]
  end

  def self.csv_headers   # useful as a thing when we have to deal with csv to self head , not sure where else
    # ['id', 'first_name', 'last_name', 'address_first_line', 'address_second_line', 'suburb', 'postcode', 
    #  'phone_number','email', 'username']
    # is equiv to below 
    %w[id first_name last_name address_first_line address_second_line suburb postcode phone_number email username password]
  end

  def to_array
   [@id, @first_name, @last_name, @address_first_line ,@address_second_line, @suburb, @postcode, @phone_number,
    @email, @username, @password]
  end

  def to_s
     # "#{self.first_name} #{self.last_name} is a Person (base class) with id #{self.id} " equiv to 
    "#{first_name} #{last_name} is a Person (base class) with id #{id} "
  end 

end

# Don't forget id numbers will really be assigned by the repository and almost certainly by the DB in reality
# The model class only is only responsible for the structure of the class and methods associated with the class

# my_person = Person.new(id:1 , first_name: 'Sally', last_name: 'Williamson',  address_first_line: '17 Numantia Rd', 
#                       suburb: 'Engadine', email: 'Sally@gmail.com' , username: 'Sally1')

#  puts my_person.to_s
#  p Person.csv_headers
