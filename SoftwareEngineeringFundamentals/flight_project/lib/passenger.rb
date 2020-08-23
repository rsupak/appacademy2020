class Passenger
  attr_reader :name
  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(str)
    @flight_numbers.include?(str.upcase) || @flight_numbers.include?(str.downcase)
  end

  def add_flight(str)
    @flight_numbers << str.upcase unless has_flight?(str)
  end
end
