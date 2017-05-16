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
      @bikes.slice(identify_working_bike)
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

  def identify_working_bike

  i=0;

  until @bikes[i].broken == false do
    i=i+1
  end
  i
  end



end
