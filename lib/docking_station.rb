require_relative 'bike'
require_relative 'van'

class DockingStation

  attr_reader :bikes
  attr_reader :capacity
  attr_reader :working_bikes_array
  attr_reader :broken_bikes_array
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes=[]
    @working_bikes_array=[]
    @broken_bikes_array=[]
  end

  def release_bike
    if empty? || no_working_bikes?
      raise 'No bikes available'
    else
      @bikes.delete(remove_bike)
    end
  end

  def dock(bike)
    if full?
      raise 'Docking Station is Full'
    else
      add_to_array(bike)
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

  def no_working_bikes?
    @working_bikes_array.length == 0
  end

  def remove_bike
    @working_bikes_array.pop
  end

  def working_bikes
    @working_bikes_array.length
  end

  def broken_bikes
    @broken_bikes_array.length
  end

  def total
    @bikes.length
  end

  def add_to_array(bike)
    if bike.broken == false
      @working_bikes_array.push(bike)
    else
      @broken_bikes_array.push(bike)
    end
  end


end
