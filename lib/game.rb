require 'board'

class Game
  attr_reader :board, :rules

  def initialize(rules)
    @player = []
    @rules  = rules
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

  def validate_build_plan build_plan
    (@rules[build_plan.size]) && (@rules[build_plan.size] > 0)
  end
end