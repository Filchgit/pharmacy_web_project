requires 'pry-byebug'

class BaseView
    def initialize

    end

    def ask_user_for(stuff)
        puts "Please provide a(n) #{stuff.downcase}."
        print "> "
        return gets.chomp
      end
end
