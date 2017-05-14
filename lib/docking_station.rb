require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes=[]
  end

  def release_bike
    if @bikes.empty?
      raise 'No bikes available'
    else
      @bikes.pop
    end
  end

  def dock(bike)
    if @bikes.length < 20
      @bikes.push(bike)
    else
      raise'Docking Station is Full'
    end
  end

end
