require_relative './person'

class Employee < Person
  attr_accessor :id, :first_name, :last_name, :address_first_line, :address_second_line, :suburb, :postcode, 
                :phone_number, :email, :security_level, :password, :username

  def initialize(attributes = {})
    super
    # this super is awesome!!! Grabs all the crap within the base method and superimposes it in the child method
    @security_level = attributes[:security_level]
  end

  # awesome !! the shift enter trick works on this editor too!!! makes a long line easily readable
  def to_s
    "#{first_name} #{last_name} is a Employee (child class of Person) with id #{id} 
     and security level of #{security_level}"
  end

  def to_array
    # [@id, @first_name, @last_name, @address_first_line ,@address_second_line, @suburb, @postcode, @phone_number,@email]
    super.push(@security_level )
  end

  def self.csv_headers
    # useful as a thing when we have to deal with csv to self head , not sure where else
    # ['id', 'first_name', 'last_name', 'address_first_line', 'address_second_line', 'suburb',
    #  'postcode', 'phone_number','email']
    # is equiv to below  wonder if we could do a similiar push trick here???
    # this is currently annoying as have to update manually
    %w[id first_name last_name address_first_line address_second_line suburb postcode phone_number
       email username password security_level ]
  end
end

#  my_employee = Employee.new(first_name: 'Fred', last_name: 'Flinstone', security_level: 1 ,
#                              id: 246, password: 'supasecret', username: 'Fred2')

# my_employee 
# p Employee.csv_headers
# p my_employee.to_array
