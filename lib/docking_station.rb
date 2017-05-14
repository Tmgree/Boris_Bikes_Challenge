require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes=[]
  end

  def release_bike
    if empty?
      raise 'No bikes available'
    else
      @bikes.pop
    end
  end

  def dock(bike)
    if full?
      raise'Docking Station is Full'
    else
      @bikes.push(bike)
    end
  end

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.length == 0
  end

end
