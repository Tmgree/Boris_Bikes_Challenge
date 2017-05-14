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

end
