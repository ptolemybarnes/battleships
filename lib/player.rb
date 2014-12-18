class Player
attr_accessor :inventory

  def initialize(rules)
    @inventory = rules
  end

  def validate_build_plan build_plan
    ship_size = build_plan.size
    if (inventory[ship_size]) && (inventory[ship_size] > 0)
      remove_from_inventory ship_size
    else
      raise 'Error: Invalid build plan! Your inventory does not allow a ship of that size.'
    end
  end

  def remove_from_inventory shipsize
    inventory[shipsize] = inventory[shipsize] - 1
  end

end