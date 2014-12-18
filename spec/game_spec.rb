require './lib/game'
require './lib/board'

rules_array = [
  nil, #0
  nil, #1
  3, #2
  3, #3
  2, #4
  0, #5
]

build_plan = [[0,1],[0,2],[0,3],[0,4]]
build_plan_of_5 = [[0,1],[0,2],[0,3],[0,4],[0,5]]
build_plan_of_2 = [[0,1],[0,2]]

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
    it 'returns false when player tries to build a ship of an unavailable size' do
      expect(lambda { game.validate_build_plan(build_plan_of_5) }).to raise_error('Error: Invalid build plan! Your invenotry does not allow a ship of that size.')
    end
    it 'subtracts one from the inventory.' do
      game.remove_from_inventory 4
      expect(game.inventory[4]).to eq(1)
    end
    it 'subtracts one from inventory when build plan is valid' do
      game = Game.new rules_array
      game.validate_build_plan build_plan_of_2
      expect(game.inventory[2]).to eq(2)
      game.validate_build_plan build_plan_of_2
      expect(game.inventory[2]).to eq(1)
    end
  end
end