require './lib/ship'

describe Ship do
let(:ship) {Ship.new}


  context 'when initialized' do
    it "has length given by argument" do
      ship = Ship.new(3)
      expect(ship.measure_length).to eq(3)
    end
  end

  it "knows when it's sunk" do

  end



end