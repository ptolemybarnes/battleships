require './lib/ship_section'

class Ship
  attr_reader :ship_body

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

  def damage_report
    @ship_body.select {|section| section.hit? }.count
  end

  def sunk?
    damage_report == measure_length
  end
  
end