require_relative 'bike'

class DockingStation

  attr_reader :bikes
  attr_reader :capacity
  attr_reader :working_bikes
  attr_reader :working_bikes_array
  attr_reader :broken_bikes
  attr_reader :total
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes=[]
    @working_bikes_array=[]
    @working_bikes=0
    @broken_bikes=0
    @total=0
  end

  def release_bike
    if empty? || no_working_bikes?
      raise 'No bikes available'
    else
      #remove_from_counter(bike)
      @bikes.slice!(@working_bikes-1)
    end
  end

  def dock(bike)
    if full?
      raise 'Docking Station is Full'
    else
      add_to_counter(bike)
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
    @working_bikes == 0
  end

  def add_to_counter(bike)
    if bike.broken == false
      @working_bikes +=1
      @total +=1
    else
      @broken_bikes +=1
      @total +=1
    end
  end

  def remove_from_counter(bike)
    if bike.broken == false
      @working_bikes -=1
      @total -=1
    else
      @broken_bikes -=1
      @total -=1
    end
  end

  def find_working_bike

  end



end
