require_relative 'docking_station'

class Van

  attr_reader :working_bikes_van
  attr_reader :broken_bikes_van

  def initialize
    @working_bikes_van=[]
    @broken_bikes_van=[]
  end

  def collect_bikes(docking_station)
    if docking_station.broken_bikes_array == []
      raise 'No broken Bikes'
    else
      take_bikes(docking_station)
      docking_station.reset_broken_bikes
      docking_station.reset_bikes
      @broken_bikes_van
    end
  end

  def take_bikes(docking_station)
    for i in 0...(docking_station.broken_bikes_array.length) do
      @broken_bikes_van.push(docking_station.broken_bikes_array[i])
    end
    @broken_bikes_van
  end

end
