require_relative 'lib/baot'
require_relative 'lib/water_fowl'
require_relative 'lib/passenger'

class Duckboat
  attr_reader :passengers

  def initialize
    @passengers = []
  end

  def load_passenger(name)
    if @passengers.size < passenger_capacity
      @passengers << Passenger.new(name)
      puts "Welcome aboard, #{name}"
    end
  end
end
