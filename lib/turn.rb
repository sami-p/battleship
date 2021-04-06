require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class Turn
  def initialize
  end
end

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
