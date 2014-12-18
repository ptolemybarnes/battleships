require './lib/board'
require './lib/player'

class Game
  attr_reader :board, :rules

  def initialize(rules)
    @player = []
    @rules = rules
    register_player
  end

  def register_player
    @player << Player.new(rules)
  end

  def player_count
    @player.count
  end

  def current_player
    @player.sample
  end

  def set_ships_prompt
     'You are ready to place the ships.'
  end

  def validate_build_plan build_plan
    ship_size = build_plan.size
    if (current_player.inventory[ship_size]) && (current_player.inventory[ship_size] > 0)
      remove_from_inventory ship_size
    else
      raise 'Error: Invalid build plan! Your inventory does not allow a ship of that size.'
    end
  end

  def remove_from_inventory shipsize
    current_player.inventory[shipsize] = current_player.inventory[shipsize] - 1
  end
end