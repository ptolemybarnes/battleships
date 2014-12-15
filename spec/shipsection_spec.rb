require './lib/ship_section'

describe ShipSection do

  let(:ship) {ShipSection.new}

  context 'when initialized' do
    it 'has a location' do
      ship = ShipSection.new(x: 5, y: 5)
      expect(ship.location[:x]).to eq(5)
      expect(ship.location[:y]).to eq(5)
    end
  end

  it 'can be hit' do
    ship.hit!
    expect(ship.hit?).to eq true
  end

end