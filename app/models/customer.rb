require_relative './person'

class Customer < Person
  attr_accessor :id, :first_name, :last_name, :address_first_line, :address_second_line, :suburb, :postcode,
                :phone_number, :email, :posts_read

  def initialize(attributes = {})
    super
    @posts_read = attributes[:posts_read]
  end

  def to_s
    "#{first_name} #{last_name} is a Customer (child class of Person) with id #{self.id} and has read #{self.posts_read} posts \n"
  end

  def to_array
    super.push(@posts_read)
  end

  def self.csv_headers
    %w[id first_name last_name address_first_line address_second_line suburb postcode phone_number email posts_read]
  end 
end

# my_customer = Customer.new(first_name: "John", posts_read: 121)
# p my_customer
# p Customer.csv_headers
# print my_customer

