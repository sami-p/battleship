class Ship
  attr_reader :name,
                   :health,
                   :length

  def initialize(name, health)
    @name = name
    @health = health
    @length = health
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end

  def hit
    @health -= 1
  end
end
