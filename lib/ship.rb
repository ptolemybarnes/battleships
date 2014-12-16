require './lib/ship_section'

class Ship
  attr_reader :ship_body

  def initialize(build_options = {})
    @build_type = build_options[:type] || ShipSection
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

  def build_ship(build_options = {})
    build_plan = make_build_plan(build_options)
    build_ship(build_plan)
  end

  def make_build_plan(build_options = {})
    build_plan = [build_options[:head]]
    until build_plan.last == build_options[:tail]
      build_plan << next_section_location([build_plan.last,build_options[:tail]])
    end
    build_plan
  end

  def build_sections(build_plan)
    @ship_body = build_plan.map {|coordinate| ShipSection.new(coordinate)}
  end
  
  def next_section_location(coordinates) # takes an array [[x,y],[x,y]]

    current_x = coordinates[0][0]
    current_y = coordinates[0][1]
    tail_x    = coordinates[1][0]
    tail_y    = coordinates[1][1]

    x_difference = tail_x - current_x
    y_difference = tail_y - current_y

    if (x_difference.abs <=> y_difference.abs) == 1
      axis_to_change = :x
    else
      axis_to_change = :y
    end

    if axis_to_change == :x
      if x_difference > 0
        new_x = current_x + 1
      else
        new_x = current_x - 1
      end
      new_y = current_y
    elsif axis_to_change == :y
      if y_difference > 0
        new_y = current_y + 1
      else
        new_y = current_y - 1
      end
      new_x = current_x
    end

    [new_x,new_y]
  end
end