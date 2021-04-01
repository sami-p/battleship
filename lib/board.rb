class Board
  attr_reader :cells

  def initialize
    # @cells = {}
    # cell_creation
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  # def cell_creation
  #   ["A", "B", "C", "D"].each do |letter|
  #     ["1", "2", "3", "4"].each do |number|
  #       name = letter + number
  #       @cells[name] = name
  #     end
  #   end
  # end

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
