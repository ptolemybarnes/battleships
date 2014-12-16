require './lib/ship_section'

describe ShipSection do

  let(:ship) {ShipSection.new([5,5])}

  context 'when initialized' do
    it 'has a location' do
      
    end
  end

  it 'can be hit' do
    ship.hit!
    expect(ship.hit?).to eq true
  end

end