require_relative 'baot'
require_relative 'water_fowl'
require_relative 'passenger'

class Duckboat
  include Water_fowl

  attr_reader :passengers
  attr_accessor :captain

  def initialize
    @passengers = []
    @captain = nil
  end

  def load_passenger(name)
    if @passengers.size < passenger_capacity
      @passengers << Passenger.new(name)
      puts "Welcome aboard, #{name}"
    end
  end
end
