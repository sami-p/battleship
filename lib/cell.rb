class Cell
  attr_reader :coordinate,
                   :ship,
                   :fire

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if @fire == true
      true
    else
      false
    end
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fire = true
    else
      @fire = true
    end
  end

  def render(reveal = false)
    if miss?
      "M"
    elsif ship_sunk?
      "X"
    elsif ship_hit?
      "H"
    elsif reveal == true && @fire == false
      "S"
    elsif @fire == false
      "."
    end
  end

  def miss?
    @fire == true && empty? == true
  end

  def ship_sunk?
    @fire == true && ship.sunk? == true
  end

  def ship_hit?
    @fire == true && empty? == false
  end
end
