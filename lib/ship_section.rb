class ShipSection < CellContent

  def initialize(location)
    @hit = false
    super
  end

  def hit!
    @hit = true
  end

  def hit?
    @hit
  end

end

