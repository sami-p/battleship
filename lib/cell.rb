class Cell
  attr_reader :coordinate,
                   :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if fire_upon == true
      true
    else
      false
    end
  end

  def fire_upon

  end
end
