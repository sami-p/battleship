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
    if ship.length == coordinates.length
      letters = coordinates.map do |coordinate|
        coordinate.chars.first
      end
      numbers = coordinates.map do |coordinate|
        coordinate.chars.last
      end
        letter_array = letters.map do |letter|
          letter.ord
        end
    end
require 'pry'; binding.pry
    # Need to check if the string "letter" is in order or the same.
    # Need to check is the string "integer" consecutive
    # First step is to split the string by characters to isolate letter from number
    # name.split

    # User map and chars.first / chars.last . Set new array to variables.
  end

  # def valid_length?(ship, coordinates)
  #   if ship.length == coordinates.length
  #     true
  #   else
  #     false
  #   end
  # end

  # def consecutive(ship, coordinates)
  # end

  # def not_diagonal(ship, coordinates)
  # end
end
