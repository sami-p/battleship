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

  def render(show = false)
    if @fire == true && empty? == true
      "M"
    elsif @fire == true && ship.sunk? == true
      "X"
    elsif
      @fire == true && empty? == false
      "H"
    elsif show == true && @fire == false
      "S"
    elsif @fire == false
      "."
    end
  end
end
