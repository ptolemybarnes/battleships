require './lib/cell_content'
require './lib/ship'

class Board
  attr_reader :grid, :size 

  def initialize(size)
    @size = size
    @grid = []
    create_rows_of size
    fill_rows_with_cells
  end

  def place_ship location = {}
    ship = Ship.new(head: location[:head], tail: location[:tail])
    ship.ship_body.each {|section| place_a section }
  end

  def place_a cell_content
    x, y = cell_content.location
    grid[y][x] = cell_content
  end

  def place_cell_content_at location
    place_a CellContent.new(location)
  end

  def create_rows_of size
    size.times { @grid.push [] }
  end

  def fill_rows_with_cells
    @grid.each_with_index {|row, row_number| fill_a_row_with_cells row_number }
  end

  def fill_a_row_with_cells row_number
    size.times {|column_number| place_cell_content_at [row_number,column_number]}
  end

  def generate_tracking_grid
    @grid.map {|row| generate_tracking_row row }
  end

  def generate_tracking_row row
    row.map {|cell| cell.hit? ? true : false }
  end

end
