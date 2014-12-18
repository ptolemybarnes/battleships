require './lib/ship'
require 'byebug'
require './lib/coordinate_methods'

describe Ship do

let(:board) { double(:board)}
let(:ship) {Ship.new(head:[0,0],tail:[0,2],board: board)}

  context 'it can build ships' do

    it 'can create a plan of where to build sections' do
      expect(ship.make_build_plan_from(head:[10.y,10.x], tail:[7.y,10.x])).to eq([[10.y,10.x],[9.y,10.x],[8.y,10.x],[7.y,10.x]])
    end

    it 'can build a ship of 4 sections' do
      ship.build_sections_using([[10.y,10.x],[9.y,10.x],[8.y,10.x],[7.y,10.x]])
      expect(ship.measure_length).to eq(4)
    end

    it 'can build a ship of 4 sections with correct locations' do
      build_options = {head:[10.y,10.x], tail:[10.y,7.x]}
      ship.build_ship_using build_options
      section1, section2, section3, section4 = ship.ship_body.first, ship.ship_body[1],ship.ship_body[2],ship.ship_body[3]
      expect(section1.location).to eq([10.y,10.x])
      expect(section2.location).to eq([10.y,9.x])
      expect(section3.location).to eq([10.y,8.x])
      expect(section4.location).to eq([10.y,7.x])
    end

    it 'can build a ship of a certain size when created' do
      ship = Ship.new(head:[6.y,7.x],tail:[6.y,9.x])
      expect(ship.measure_length).to eq(3)
    end

    context 'can check that its board plan is valid' do

      it 'knows when a coordinate is invalid.' do
        allow(board).to receive(:validate).with([5,5]).and_return(false)
        expect(lambda { ship.location_is_valid?([5,5]) }).to raise_error("Error: [5, 5] is invalid. Revise your build plan.")
      end

      it 'knows when a coordinate is valid' do
        allow(board).to receive(:validate).with([5,5]).and_return(true)
        expect(ship.location_is_valid?([5,5])).to eq(true)
      end

      it 'can validate a valid board plan' do
        build_plan = [[5,5],[5,6],[5,7]]
        allow(board).to receive(:validate).with(build_plan[0]).and_return(true)
        allow(board).to receive(:validate).with(build_plan[1]).and_return(true)
        allow(board).to receive(:validate).with(build_plan[2]).and_return(true)
        
        expect(ship.validate_build_plan(build_plan)).to eq(true)
      end
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
      dead_ship  = summon_decimated_ship
      alive_ship = ship
      expect(dead_ship.sunk?).to  be(true)
      expect(alive_ship.sunk?).to be(false)
    end
  end
end

def summon_decimated_ship
  ship = Ship.new(head:[0.y,0.x],tail:[0.y,2.x])
  ship.ship_body.each {|section| section.hit! }
  ship
end