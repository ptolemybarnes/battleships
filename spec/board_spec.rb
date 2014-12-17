require './lib/board'
require 'byebug'
require './lib/cell_content'

describe Board do

let(:board)        { Board.new(10) }
let(:ship_section) { double(:ship_section, location: [3,7])}
let(:cell_content) { double(:cell_content, location: [3,7])}

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
      x, y = cell_content.location
      expect(board.grid[y][x]).to be(cell_content)
    end

    it 'can place a cell content at a certain location' do
      board.place_cell_content_at [5,5]
      expect(board.grid[5][5]).to be_a_kind_of(CellContent)
    end
  end

  context 'knows what is at a grid location' do

  end

  context '' do
    it 'can return a grid showing which cells have been shot at' do
      board = Board.new(3)
      board.grid[0][0].hit!
      expect(board.generate_tracking_grid[0][0]).to be(true)
      expect(board.generate_tracking_grid[0][1]).to be(false)
    end
    it 'can return a tracking row showing which cells in the row have been shot at' do
      board = Board.new(3)
      board.grid[0][0].hit!
      expect(board.generate_tracking_row board.grid[0]).to eq([true,false,false])
    end
  end
end