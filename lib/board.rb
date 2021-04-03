class Board
  attr_reader :cells,
              :letter_array,
              :num_array

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
    @letter_array.each_cons(2).all? { |x, y| x == y - 1 } || @letter_array.each_cons(2).all? { |x, y| x == y }
  end

  def num_cons
    @num_array.each_cons(2).all? { |x, y| x == y - 1 } || @num_array.each_cons(2).all? { |x, y| x == y }
  end

  def diagonal_cons
    @letter_array.each_cons(2).all? { |x, y| x == y - 1 } && @num_array.each_cons(2).all? { |x, y| x == y - 1 }
  end

  def valid_placement?(ship, coordinates)
    if ship.length == coordinates.length && @cells[coordinates].nil?
      ord_arrays(coordinates)
        if (letter_cons && num_cons == true) && (diagonal_cons == false)
          true
        else
          false
        end
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      (@cells[coordinate]).place_ship(ship)
    end
  end
end
