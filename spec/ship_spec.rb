require './lib/ship'
require 'byebug'

describe Ship do

let(:ship) {Ship.new}

  context 'when initialized' do
    describe 'it can build ships' do
      it 'can work out where the next section should go' do
        expect(ship.next_section_location([[5,5], [5,7]])).to eq([5,6])
        expect(ship.next_section_location([[0,0], [0,2]])).to eq([0,1])
        expect(ship.next_section_location([[5,5], [5,3]])).to eq([5,4])
      end
      it 'can create a plan of where to build sections' do
        expect(ship.make_build_plan(head:[10,10], tail:[10,7])).to eq([[10,10],[10,9],[10,8],[10,7]])
      end
      it 'can build a ship of 4 sections' do
        ship.build_sections([[10,10],[10,9],[10,8],[10,7]])
        expect(ship.measure_length).to eq(4)
      end
    end
  end

#   context 'it can be sunk' do

#     it 'keeps count of the number of times it has been hit' do
#       ship = summon_decimated_ship
#       expect(ship.damage_report).to eq(3)
#     end

#     it "knows when it's sunk" do
#       ship = summon_decimated_ship
#       expect(ship.sunk?).to be(true)
#     end

#     it 'only sinks when all ship sections are hit' do
#       dead_ship  = summon_decimated_ship
#       alive_ship = Ship.new(3)
#       expect(dead_ship.sunk?).to  be(true)
#       expect(alive_ship.sunk?).to be(false)
#     end
#   end

# end

# def summon_decimated_ship
#   ship = Ship.new(3)
#   ship.ship_body.each {|section| section.hit! }
#   ship
# end

end