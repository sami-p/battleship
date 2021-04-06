require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/carl_computer'
require './lib/game'

class Turn
  def initialize
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cruiser_1 = Ship.new("Cruiser", 3)
    @submarine_1 = Ship.new("Submarine", 2)
    @board = Board.new
    @carl_board = Board.new
    @carl_computer = CarlComputer.new(@carl_board)
  end

  # def show_boards
  #   puts " "
  #   puts "🔥" " CARL THE COMPUTER'S BOARD " "🔥"
  #   puts @carl_board.render
  #   puts " "
  #   puts "🔥" " CAPTAIN (player_name's) BOARD " "🔥"
  #   puts @board.render(true)
  #   puts " "
  #   puts "Take your shot at Carl's ships!"
  #   print "> "
  #   player_input = $stdin.gets.chomp
  #   take_turn
  # end

  # def take_turn
  #   player_input = @carl_board.cells.cell.fire_upon
  #   @carl_board.carl_fires
  #   @board.cell.fire_upon
  # end
end

# turn = Turn.new
# turn.show_boards
#new turn

#used this for iteration through the turns.
#Asked how do we do this of all the bullet points
#Find things that would cycle so that you would clear the cycle over time
#check the status of the cells  A LOT
#  What does that cell contain?
#  Has it been fired upon?
#  Used the cell class a lot

#COMPUTER CLASS
# For testing (have true for render for computer)

#PLAYER CLASS
# this could be a lot of logic

#TURN CLASS
# kind of the ref between the two classes

#DISPLAYING THE BOARD
# board.render - for plaer
# board.

#Define win
# When the board has all ships sunk? == true
# A method to check if the shot is still here
# Something to keep track of the score, does the game have a counter?
#
