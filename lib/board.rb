class Board
  attr_accessor :cells
  attr_reader :letter_array,
              :num_array,
              :spaces

  def initialize
    @cells = {}
    @spaces = []
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

  def valid_placement?(ship, coordinates)
    if compare_all_length(ship, coordinates) && not_overlapping(coordinates)
      ord_arrays(coordinates)
        return true if compare_all_coord
          false
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        (@cells[coordinate]).place_ship(ship)
      end
    end
  end

  def render(reveal = false)
     " 1 2 3 4 \n" +
    "A    #{@cells["A1"].render(reveal)} #{@cells["A2"].render(reveal)} #{@cells["A3"].render(reveal)} #{@cells["A4"].render(reveal)}\n" +
    "B    #{@cells["B1"].render(reveal)} #{@cells["B2"].render(reveal)} #{@cells["B3"].render(reveal)} #{@cells["B4"].render(reveal)}\n" +
    "C    #{@cells["C1"].render(reveal)} #{@cells["C2"].render(reveal)} #{@cells["C3"].render(reveal)} #{@cells["C4"].render(reveal)}\n" +
    "D    #{@cells["D1"].render(reveal)} #{@cells["D2"].render(reveal)} #{@cells["D3"].render(reveal)} #{@cells["D4"].render(reveal)}\n"
  end

  def not_overlapping(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
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

  def compare_all_coord
    (letter_cons && num_cons == true) && (diagonal_cons == false)
  end

  def compare_all_length(ship, coordinates)
    ship.length == coordinates.length && @cells[coordinates].nil?
  end
end
