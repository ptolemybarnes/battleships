require './lib/game'

describe Game do 
  let(:player1)  {double(:player)}
  it 'Can register a player' do
    game = Game.new
    game.register_player(player1)
    expect(game.player_count).to eq 1
  end

  context 'Can set the board' do
    it 'can set to any size' do
      game = Game.new
      game.set_board_size(5)
      expect(game.board_size).to eq 5
    end

  end

  context 'Players can set their ships' do

  end
end
