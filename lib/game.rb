class Game

  attr_reader :board
  def initialize
    @player = []
  end

  def register_player(player)
    @player << player
  end

  def player_count
    @player.count
  end

  def set_board_size(size)
    @board = Board.new(size)
  end

  # def set_all_ships(player)
  #   ships.each { |ship| }
  # end

end