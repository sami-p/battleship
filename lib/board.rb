class Board
  attr_reader :cells

  def initialize
    @cells = {}
    cell_creation
  end

  def cell_creation
    ["A", "B", "C", "D"].each do |letter|
      ["1", "2", "3", "4"].each do |number|
        name = letter + number
        @cells[name] = Cell.new(name)
      end
    end
  end

  def valid_coordinate?(cell)
    if @cells.key?(cell)
      true
    else
      false
    end
  end

  def valid_placement?(ship, coordinates)
    if valid_length?(ship, coordinates)
    end
  end

  def valid_length?(ship, coordinates)
    if ship.length == coordinates.length
      true
    else
      false
    end
  end

  # def consecutive(ship, coordinates)
  # end

  # def not_diagonal(ship, coordinates)
  # end
end
