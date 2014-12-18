require 'board'

class Game
  attr_reader :board, :inventory

  def initialize(rules)
    @player = []
    @inventory = rules
  end

  def register_player(player)
    @player << player
  end

  def player_count
    @player.count
  end

  def set_ships_prompt
     'You are ready to place the ships.'
  end

  def regulate_ship_plan

  end

  def validate_build_plan build_plan
    ship_size = build_plan.size
    if (inventory[ship_size]) && (inventory[ship_size] > 0)
      remove_from_inventory ship_size
    else
      raise 'Error: Invalid build plan! Your invenotry does not allow a ship of that size.'
    end
  end

  def remove_from_inventory shipsize
    inventory[shipsize] = inventory[shipsize] - 1
  end
end