require_relative 'van'

class Garage

  attr_reader :garage_bikes

  def initialize
    @garage_bikes = []
  end

  #This function will fix directly from van

  def fix_bikes2(van)
    van.bikes_van.each do |i|
      i.fix
    end
  end

  #But if you want to take the bikes from the van, fix them
  #Then redock to the van you can use these functions
  #or you can add a broken bike directly into the garage for fixing

  def fix_bikes
    @garage_bikes.each do |i|
      i.fix
    end
  end

  def take_bikes_from_van(van)

    if van.bikes_van == []
      raise 'No broken Bikes'
    else
      for i in 0...(van.bikes_van.length) do
        @garage_bikes.push(van.bikes_van[i])
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
      van.bikes_van.push(@garage_bikes[i])
    end
    @bikes_van
  end


end
