class CarlComputer
  attr_accessor :carl_board,
                   :carl_shots,
                   :ship_2,
                   :ship_3,
                   :ships

  def initialize(carl_board)
    @carl_board = carl_board
    @carl_shots = @carl_board.cells.keys
    @ship_2 = Ship.new('Submarine', 2)
    @ship_3 = Ship.new('Cruiser', 3)
    @ships = []
  end

  def add_ships
    @ships << @ship_2
    @ships << @ship_3
    @ships
  end

  def carl_ship_coordinates(ship, length)
    coordinates = []
    until @carl_board.valid_placement?(ship, coordinates)
      comp_coordinates = @carl_board.cells.keys.sample(length)
      coordinates = comp_coordinates
    end
    coordinates
  end

  def computer_place_ship(ship)
    coordinates = carl_ship_coordinates(ship, ship.length)
    @carl_board.place(ship, coordinates)
  end

  def carl_fires
    guess = @carl_shots.sample

    @carl_board.cells[guess].fire_upon
    @carl_shots.delete(guess)
  end
end
  
