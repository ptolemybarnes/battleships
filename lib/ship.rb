require './lib/ship_section'

class Ship

  def initialize(length)
    @ship_body = []
    build_ship(length)
  end

  def measure_length
    @ship_body.count
  end

  def build_ship(length)
    length.times { @ship_body << ShipSection.new }
  end



end