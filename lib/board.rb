require './lib/cell_content'
require './lib/ship'

class Board
  attr_reader :grid, :size, :game

  def initialize(size, game)
    @size = size
    @grid = []
    @fleet = []
    @game = game
    create_rows_of size
    fill_rows_with_cells
  end

  def place_ship location = {}
    ship = Ship.new(head: location[:head], tail: location[:tail], board: self, game: game)
    ship.ship_body.each {|section| place_a section }
    @fleet << ship
  end

  def count_ship
    @fleet.count
  end

  def place_a cell_content
    y, x = cell_content.location
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

  def validate location
    y, x = location
    if grid[y] && grid[y][x]
      grid[y][x].class == CellContent
    else
      false
    end
  end
end
