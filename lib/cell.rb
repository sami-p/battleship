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
      "Ⓜ️ "
    elsif ship_sunk?
      "🔥"
    elsif ship_hit?
      "💥"
    elsif empty? || (@fire == false && reveal == false)
      "・"
    elsif reveal == true && @fire == false
      "⛵️"
    end
  end

  def miss?
    empty? == true && @fire == true
  end

  def ship_sunk?
   empty? == false && @fire == true && ship.sunk? == true
  end

  def ship_hit?
    empty? == false && @fire == true && empty? == false
  end
end
