require_relative 'bike'

class DockingStation

  attr_reader :bikes
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes=[]
  end

  def release_bike
    if empty?
      raise 'No bikes available'
    else
      dock_bike_broken
      @bikes.pop
    end
  end

  def dock(bike)
    if full?
      raise 'Docking Station is Full'
    else
      @bikes.push(bike)
    end
  end

  def full?
    @bikes.size >= @capacity ? true : false
  end

  def empty?
    @bikes.length == 0
  end

  def dock_size
    @bikes.length
  end

  def dock_bike_broken
    if @bikes[0].broken == true
      5
    else
      6
    end
  end



end
