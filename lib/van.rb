require_relative 'docking_station'

class Van

  attr_reader :bikes_van

  def initialize
    @bikes_van=[]
  end

  def collect_bikes(docking_station)
    if docking_station.broken_bikes_array == []
      raise 'No broken Bikes'
    else
      take_bikes(docking_station)
      docking_station.reset_broken_bikes
      docking_station.reset_bikes
      @bikes_van
    end
  end

  def take_bikes(docking_station)
    for i in 0...(docking_station.broken_bikes_array.length) do
      @bikes_van.push(docking_station.broken_bikes_array[i])
    end
    @bikes_van
  end

  def reset_broken_bikes_van
    @bikes_van.clear
  end

  def take_bike(bike)
    @bikes_van.push(bike)
  end

end
