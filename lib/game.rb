class Game

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
    board = Board.new(size)
  end

end