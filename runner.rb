require './lib/board'
require './lib/game'

board = Board.new
game = Game.new(board)
game.start
