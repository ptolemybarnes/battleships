require './lib/player'

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


describe Player do

  let(:player) { Player.new rules_array }

  context 'when created' do
    it 'has an inventory' do
      expect(player.inventory).to be_a_kind_of(Array)
    end
  end

   context 'Players can set their ships' do

    it 'returns false when player tries to build a ship of an unavailable size' do
      expect(lambda { player.validate_build_plan(build_plan_of_5) }).to raise_error('Error: Invalid build plan! Your inventory does not allow a ship of that size.')
    end
    it 'subtracts one from the inventory.' do
      player.remove_from_inventory 4
      expect(player.inventory[4]).to eq(1)
    end
    it 'subtracts one from inventory when build plan is valid' do
      player = Player.new rules_array
      player.validate_build_plan build_plan_of_2
      expect(player.inventory[2]).to eq(2)
      player.validate_build_plan build_plan_of_2
      expect(player.inventory[2]).to eq(1)
    end
  end
end