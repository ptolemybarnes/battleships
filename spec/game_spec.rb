require './lib/game'
require './lib/board'

describe Game do 
  let(:game) {Game.new}
  let(:player1)  {double(:player)}
  it 'Can register a player' do
    game.register_player(player1)
    expect(game.player_count).to eq 1
  end

  context 'Can set the board' do
    it 'can set to any size' do
      game.set_board_size(5)
      expect(game.board.size).to eq 5
    end

  end

  context 'Players can set their ships' do
    it 'will prompt player to set ships' do
      expect(game.set_ships_prompt).to eq 'You are ready to place the ships.'
    end

    it 'can set the battleship' do
      game.set_board_size(5)
      game.set_battleship([2,1], [2,5])
      expect(game.board.count_ship).to eq 1
    end

    # it 'player should be able to input ship location' do
    #   expect(game.get_player_input).to eq([[2,2],[5,2]])
    # end
  end
end
