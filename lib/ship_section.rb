class ShipSection
  attr_reader :location

  def initialize(location = {})
    @hit = false
    @location = location
  end

  def hit!
    @hit = true
  end

  def hit?
    @hit
  end

end