require './lib/board'

describe Board do

let(:board)        { Board.new(10) }
let(:ship_section) { double(:ship_section, location: [3,7])}

  it 'can store a grid' do
    expect(board.grid).to be_a_kind_of(Array)
  end

  it 'can store a grid with 5 rows' do
    board
    expect(board.grid.size).to eq(10)
  end

  it 'can register a shot' do
    board.place_marker_at y: 5, x: 5
    expect(board.grid[5][5]).to eq('hit')
  end

  context 'can place a ship_section' do

    it 'at a certain location given by the ship_section' do
      board.place_a ship_section
      x, y = 3, 7
      expect(board.grid[y][x]).to be(ship_section)
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