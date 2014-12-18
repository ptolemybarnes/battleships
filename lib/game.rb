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
end