# require_relative 'boat'
# require_relative 'water_fowl'
# require_relative 'passenger'
#
# class Duckboat
#   include Water_fowl
#   include Boat
#
#   attr_reader :passengers
#
#   def initialize
#     @passengers = []
#   end
#
#   def load_passenger(name)
#     if @passengers.size < passenger_capacity
#       @passengers << Passenger.new(name)
#       puts "Welcome aboard, #{name}"
#     end
#   end
# end
