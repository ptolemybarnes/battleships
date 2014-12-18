require './lib/board'
require 'byebug'
require './lib/cell_content'
require './lib/coordinate_methods'

describe Board do

let(:board)        { Board.new(10) }
let(:ship_section) { double(:ship_section, location: [3.y,7.x])}
let(:cell_content) { double(:cell_content, location: [7.y,3.x])}

  context 'can build a board of a certain size' do
    it 'can build a board with 10 rows' do
      board = Board.new 10
      expect(board.grid.size).to be(10)
    end
    it 'a 10x10 board will contain 100 cell contents' do
      expect(board.grid.flatten.select {|cell| cell.class == CellContent }.count).to eq(100)
    end
  end

  context 'can place something in a location' do

    it 'at a certain location given by the cell_content' do
      board.place_a cell_content
      y, x = cell_content.location
      expect(board.grid[y][x]).to be(cell_content)
    end

    it 'at a certain location and cell_content\'s location will match certian location' do
      board.place_a cell_content
      y, x = cell_content.location
      expect(board.grid[y][x].location).to eq([y,x])
    end

    describe 'can place a ship of any size' do
      it 'at head and tail locations' do
        board.place_ship head: [5.y,5.x], tail: [5.y,7.x]
        expect(board.grid[5.y][5.x]).to be_a_kind_of(ShipSection)
        expect(board.grid[5.y][6.x]).to be_a_kind_of(ShipSection)
        expect(board.grid[5.y][7.x]).to be_a_kind_of(ShipSection)
      end
    end
  end

  context 'can check that a location in the grid is a valid place to put an object of a given class' do
    it 'returns false when location is off the grid' do
      expect(board.validate([12,12])).to eq(false)
    end
    it 'returns true when location is on the grid' do
      expect(board.validate([8,9])).to eq(true)
    end
    it 'returns false when grid location is not a valid place to put the object we want to place' do
      board.place_a ShipSection.new([7,6])
      expect(board.validate([7,6])).to eq(false)
    end
    it 'returns true when grid location is a valid place to put the object we want to place' do
      expect(board.validate([7,6])).to eq(true)
    end
  end

  context 'knows where the player has shot at' do
    it 'can return a grid showing which cells have been shot at' do
      board = Board.new(3)
      board.grid[0.y][0.x].hit!
      expect(board.generate_tracking_grid[0.y][0.x]).to be(true)
      expect(board.generate_tracking_grid[0.y][1.x]).to be(false)
    end
    it 'can return a tracking row showing which cells in the row have been shot at' do
      board = Board.new(3)
      board.grid[0.y][0.x].hit!
      expect(board.generate_tracking_row board.grid[0]).to eq([true,false,false])
    end
  end
end