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
    end
  end

  def take_bikes(docking_station)
    @broken_bikes_van = docking_station.broken_bikes_array
    reset_docking_station(docking_station)
  end

  def reset_docking_station(docking_station)
    docking_station.bikes = docking_station.bikes - docking_station.broken_bikes_array
  end

  def reset_broken_bikes(docking_station)
    docking_station.broken_bikes_array.clear
  end

end
