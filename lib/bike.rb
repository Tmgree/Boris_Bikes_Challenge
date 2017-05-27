class Bike

  attr_reader :broken

  def initialize
    @broken = false
  end

  def report_broken
    @broken = true
  end

  def fix
    @broken = false
  end

end
