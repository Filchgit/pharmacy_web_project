require_relative 'base_view'
require 'pry-byebug'

class CustomerView < BaseView
    def ask_user_for(stuff)
        puts "Please provide a(n) #{stuff.downcase}."
        print "> "
        return gets.chomp
      end
end