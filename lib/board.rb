class Board
  attr_reader :grid

  def initialize(rows)
    create_grid_of rows
  end

  def place_marker_at grid_ref = {}
    @grid[grid_ref[:y]][grid_ref[:y]] = 'hit'
  end

  def place_a ship_section
    x = ship_section.location.first
    y = ship_section.location.last
    grid[y][x] = ship_section
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