require './lib/player'

rules_array = [
  nil, #0
  nil, #1
  3, #2
  3, #3
  2, #4
  0, #5
]


describe Player do

  let(:player) { Player.new rules_array }

  context 'when created' do
    it 'has an inventory' do
      expect(player.inventory).to be_a_kind_of(Array)
    end
  end
end