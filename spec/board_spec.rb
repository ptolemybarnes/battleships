require './lib/board'
require 'byebug'

describe Board do

let(:board)        { Board.new(10) }
let(:ship_section) { double(:ship_section, location: [3,7])}
let(:cell_content) { double(:cell_content, location: [3,7])}

  it 'can store a grid' do
    expect(board.grid).to be_a_kind_of(Array)
  end

  it 'can store a grid with 5 rows' do
    board
    expect(board.grid.size).to eq(10)
  end

  context 'can place something inside a cell' do

    it 'at a certain location given by the cell_content' do
      board.place_a cell_content
      x, y = cell_content.location
      expect(board.grid[y][x]).to be(cell_content)
    end
  end

  context 'knows what is at a grid location' do

    it 'cell_empty? returns false when the cell is empty' do
      y, x = 5, 4
      expect(board.cell_empty?(y,x)).to be(true)
    end

    it 'cell_empty? returns false when the cell is not empty' do
      board.place_a ship_section
      x, y = 3, 7
      expect(board.cell_empty?(y,x)).to be(false)
    end
  end
end