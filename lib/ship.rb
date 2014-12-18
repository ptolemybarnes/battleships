require './lib/ship_section'
require './lib/coordinate_methods'

class Ship
  attr_reader :ship_body, :board, :player

  def initialize(build_options = {})
    @build_type =    build_options[:type] || ShipSection
    @board      =    build_options[:board]
    @player       =    build_options[:player]
    build_ship_using build_options
  end

  def measure_length
    @ship_body.count
  end

  def damage_report
    @ship_body.select {|section| section.hit? }.count
  end

  def sunk?
    damage_report == measure_length
  end


  # private

  def build_ship_using build_options
    build_plan =         make_build_plan_from build_options
    build_sections_using build_plan
  end

  def make_build_plan_from build_options
    build_plan = [build_options[:head]]
    until build_plan.last == build_options[:tail]
      build_plan << build_plan.last.tickto(build_options[:tail])
    end
    build_plan
  end

  def build_sections_using build_plan
    @ship_body = build_plan.map {|coordinate| ShipSection.new(coordinate)}
  end

  def validate_build_plan build_plan
    player.validate_build_plan build_plan
    build_plan.all? {|coordinate| location_is_valid? coordinate }
  end
  
  def location_is_valid? location
    raise "Error: #{location} is invalid. Revise your build plan." unless @board.validate(location)
    true
  end
  
end