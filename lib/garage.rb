require_relative 'van'

class Garage

  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  def fix_bikes
    @garage_bikes.each do |i|
      i.fix
    end
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

  def take_bike(bike)
    @garage_bikes.push(bike)
  end

  def add_bikes_to_van(van)
    for i in 0...(@garage_bikes.length) do
      van.working_bikes_van.push(@garage_bikes[i])
    end
    @broken_bikes_van
  end

  def fix_bikes2(van)
    van.bikes_van.each do |i|
      i.fix
    end
  end


end
