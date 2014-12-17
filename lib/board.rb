class Board
  attr_reader :grid

  def initialize(rows)
    create_grid_of rows
  end

  def place_a cell_content
    x, y = cell_content.location
    grid[y][x] = cell_content
  end

  def cell_empty?(y,x)
    @grid[y][x].nil?
  end

  private

  def create_grid_of rows
    @grid = []
    rows.times { @grid.push [] }
  end

end