require './lib/ship_section'

describe ShipSection do

  let(:ship) {ShipSection.new}

  it 'can be hit' do
    ship.hit!
    expect(ship.hit?).to eq true
  end

end