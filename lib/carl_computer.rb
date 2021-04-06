require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class CarlComputer
  attr_accessor :ship_2,
                   :ship_3,
                   :carl_board,
                   :carl_shots,
                   :cruiser_coordinates,
                   :sub_coordinates

  def initialize
    @ship_2 = Ship.new('Submarine', 2)
    @ship_3 = Ship.new('Cruiser', 3)
    @carl_board = Board.new
    @carl_shots = @carl_board.cells.keys
    @cruiser_coordinates = []
    @sub_coordinates = []
  end

  def carl_fires
    guess = @carl_shots.sample

    @carl_board.cells[guess].fire_upon
    @carl_shots.delete(guess)
  end

  def carl_horizontal_cruiser
    @carl_shots.each_cons(3) { |coords| @cruiser_coordinates << coords }
  end

  def carl_vert_cruiser
    vertical = @carl_shots.sort_by do |vertic|
      vertic[1]
    end
    vertical.each_cons(2) { |vert| @cruiser_coordinates << vert }
  end

  def carl_horizontal_sub
    @carl_shots.each_cons(3) { |coords| @sub_coordinates << coords }
  end

  def carl_vert_sub
    vertical = @carl_shots.sort_by do |vertic|
      vertic[1]
    end
    vertical.each_cons(2) { |vert| @sub_coordinates << vert }
  end

  def cruiser_place
    until @carl_board.valid_placement?(@ship_3, coordinates = @cruiser_coordinates.sample)
      loop
    end
    @carl_board.place(@ship_3, coordinates)
  end

  def sub_place
    until @carl_board.valid_placement?(@ship_2, coordinates = @sub_coordinates.sample)
      loop
    end
    @carl_board.place(@ship_2, coordinates)
  end
end
