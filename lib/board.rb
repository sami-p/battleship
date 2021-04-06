class Board
  attr_accessor :cells
  attr_reader :letter_array,
              :num_array,
              :ship_length

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

  def valid_placement?(ship, coordinates)
    if compare_all_length(ship, coordinates) && not_overlapping(coordinates)
      ord_arrays(coordinates)
        if compare_all_coord
          true
        else
          false
        end
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
     "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(reveal)} #{@cells["A2"].render(reveal)} #{@cells["A3"].render(reveal)} #{@cells["A4"].render(reveal)}\n" +
    "B #{@cells["B1"].render(reveal)} #{@cells["B2"].render(reveal)} #{@cells["B3"].render(reveal)} #{@cells["B4"].render(reveal)}\n" +
    "C #{@cells["C1"].render(reveal)} #{@cells["C2"].render(reveal)} #{@cells["C3"].render(reveal)} #{@cells["C4"].render(reveal)}\n" +
    "D #{@cells["D1"].render(reveal)} #{@cells["D2"].render(reveal)} #{@cells["D3"].render(reveal)} #{@cells["D4"].render(reveal)}\n"
  end

  def not_overlapping(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def compare_all_length(ship, coordinates)
    ship.length == coordinates.length && @cells[coordinates].nil?
    @ship_length = ship.length
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
    (65..68).each_cons(@ship_length).include?(@letter_array)  || @letter_array.uniq.count == 1
    # @letter_array.each_cons(2) { |x, y| x == y } || @letter_array.each_cons(2) { |x, y| x == y - 1 }
  end

  def num_cons
    (1..4).each_cons(@ship_length).include?(@num_array)  || @num_array.uniq.count == 1
    # @num_array.each_cons(2) { |x, y| x == y } || @num_array.each_cons(2) { |x, y| x == y - 1 }
  end

  def diagonal_cons
    ((@letter_array.uniq.count == 1)  && (@num_array.uniq.count == 1)) || ((65..68).each_cons(@ship_length).include?(@letter_array) && (1..4).each_cons(@ship_length).include?(@num_array))
    # @letter_array.each_cons(2) { |x, y| x == y - 1 } && @num_array.each_cons(2) { |x, y| x == y - 1 } || @letter_array.each_cons(2) { |x, y| x == y } && @num_array.each_cons(2) { |x, y| x == y }
  end

  def compare_all_coord
    (letter_cons && num_cons) && (diagonal_cons == false)
  end

end
