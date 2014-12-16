require './lib/ship_section'

describe ShipSection do

  let(:ship_section) {ShipSection.new([5,5])}

  context 'when initialized' do
    it 'has a location' do
      expect(ship_section.location).to eq([5,5])
    end
  end

  it 'can be hit' do
    ship_section.hit!
    expect(ship_section.hit?).to eq true
  end

end