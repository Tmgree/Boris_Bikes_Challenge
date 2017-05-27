require_relative 'van'

class Garage

  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  def take_bikes_from_van(van)

    if van.broken_bikes_van == []
      raise 'No broken Bikes'
    else
      for i in 0...(van.broken_bikes_van.length) do
        @garage_bikes.push(van.broken_bikes_van[i])
        van.reset_broken_bikes_van
      end
      @garage_bikes
    end

  end


end
