class Board
  attr_reader :cells,
                   :letter_array,
                   :num_array

  def initialize
    @cells = {}
    cell_creation
    @letter_array = letter_array
    @num_array = num_array
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
    @cells.key?(cell)
  end

  def ord_arrays(coordinates)
    letters = coordinates.map do |coordinate|
      coordinate.chars.first
    end
    numbers = coordinates.map do |coordinate|
      coordinate.chars.last
    end
    @letter_array = letters.map do |letter|
      letter.ord
    end
    @num_array = numbers.map do |number|
      number.to_i
    end
  end

  def letter_cons
    @letter_array.each_cons(2).all? { |x, y| x == y } || @letter_array.each_cons(2).all? { |x, y| x == y - 1 }
  end

  def num_cons
    @num_array.each_cons(2).all? { |x, y| x == y - 1 } || @num_array.each_cons(2).all? { |x, y| x == y }
  end

  def diagonal_cons
    @letter_array.each_cons(2).all? { |x, y| x == y - 1 } && @num_array.each_cons(2).all? { |x, y| x == y - 1 }
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length
      ord_arrays(coordinates)
        return true if (letter_cons && num_cons == true) && (diagonal_cons == false)
        else
          false
        end
    else
      false
  end
end

# Split into two methods
# use each_con to iterate through numbers or letter
# at each index it needs to be <<ed into an array
# use documention around arthimatic - this can help with the sussing out of the logic
# Ensure the ships don't overlap - empty?
# We need to ensure that everything is -1 from each other
# Use each_con(2) to check if the horizontal letters and numbers were true.
# Need to check if the string "letter" is in order or the same.
# Need to check is the string "integer" consecutive

# Method checks whether player input valid coordinates, and the ship's placement was either horizontal or vertical
# def valid_placement?(ship, coordinates)
#   player_input_valid?(ship, coordinates) &&
#   (is_horizontal?(ship, coordinates) ||
#   is_vertical?(ship, coordinates))
# end

  # def consecutive(ship, coordinates)
  # end

  # def not_diagonal(ship, coordinates)
  # end
