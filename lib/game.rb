require 'board'

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

  def set_ships_prompt
     'You are ready to place the ships.'

  end

  def set_battleship(head_yx, tail_yx)
    @board.place_ship(head: head_yx, tail: tail_yx)
  end

  def set_second_ship(head_yx, tail_yx)
    @board.place_ship(head: head_yx, tail: tail_yx)
  end

  def set_fleet
    set_ships_prompt
    # set_battleship(head_yx, tail_yx)
    player_input = get_player_input
    set_battleship(player_input[0], player_input[1])
  end

  def get_player_input
    'Enter the x coordinate of head'
    hx = gets.chomp.to_i
    puts 'Enter the y coordinate of head'
    hy = gets.chomp.to_i
    puts 'Enter the x coordinate of tail'
    tx = gets.chomp.to_i
    puts 'Enter the y coordinate of tail'
    ty = gets.chomp.to_i
    head_location = [hy, hx]
    tail_location = [ty, tx]
    ship_location = [head_location, tail_location]
  end

  # def set_all_ships(player)
  #   ships.each { |ship| }
  # end

end