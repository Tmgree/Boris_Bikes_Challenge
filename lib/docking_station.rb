require_relative 'bike'

class DockingStation

  attr_reader :bikes
  attr_reader :capacity
  attr_reader :working_bikes
  attr_reader :broken_bikes
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes=[]
    @working_bikes=0
    @broken_bikes=0
  end

  def release_bike
    if empty? || no_working_bikes?
      raise 'No bikes available'
    else
      @bikes.slice(identify_working_bike)
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

  def identify_working_bike

  i=0;

  until @bikes[i].broken == false do
    i=i+1
  end
  i
  end

  def no_working_bikes?
    for i in 0...(@bikes.length) do
        @bikes[i].broken == true
    end
  end

  def add_to_counter(bike)
    if bike.broken == false
      @working_bikes +=1
    else
      @broken_bikes +=1
    end
  end

private
  def number_of_working_bikes
    x=0;
    for i in 0...(@bikes.length-1) do
      count_working_bikes(i,x)
    end

  end

  def count_working_bikes(i,x)
    if @bikes[i].broken == false
      x=x+1
    else
      x
    end
  end


end
