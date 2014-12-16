require './lib/ship'

describe Ship do
let(:ship) {Ship.new}


  context 'when initialized' do
    it "has length given by argument" do
      ship = Ship.new(3)
      expect(ship.measure_length).to eq(3)
    end
  end

  context 'it can be sunk' do

    it 'keeps count of the number of times it has been hit' do
      ship = summon_decimated_ship
      expect(ship.damage_report).to eq(3)
    end

    it "knows when it's sunk" do
      ship = summon_decimated_ship
      expect(ship.sunk?).to be(true)
    end

    it 'only sinks when all ship sections are hit' do
      dead_ship = summon_decimated_ship
      alive_ship = Ship.new(3)
      expect(dead_ship.sunk?).to be(true)
      expect(alive_ship.sunk?).to be(false)
    end
  end

end

def summon_decimated_ship
ship = Ship.new(3)
ship.ship_body.each {|section| section.hit! }
ship
end