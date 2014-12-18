require './lib/game'
require './lib/board'

rules_array = [
  nil, #0
  nil, #1
  3, #2
  3, #3
  2, #4
  1, #5
]

build_plan = [[0,1],[0,2],[0,3],[0,4]]

describe Game do 
  let(:rules)    { double(:rules, get_rules: rules_array)}
  let(:game)     { Game.new(rules.get_rules)}
  let(:player1)  { double(:player)}

  it 'Can register a player' do
    game.register_player(player1)
    expect(game.player_count).to eq 1
  end

  context 'Players can set their ships' do
    it 'will prompt player to set ships' do
      expect(game.set_ships_prompt).to eq 'You are ready to place the ships.'
    end
    it 'can validate a build plan against its inventory' do
      expect(game.validate_build_plan(build_plan)).to eq(true)
    end
    it 'returns an error when player tries to build a ship of an unavailable size' do
      rules_array[4] = 0
      expect(game.validate_build_plan(build_plan)).to eq(false)
    end
  end
end