require 'rspec'
require './lib/game'
require './lib/board'
require './lib/turn'
require './lib/cell'
require './lib/carl_computer'

describe CarlComputer do
  describe "initialize" do
    carl_board = Board.new
    carl = CarlComputer.new(carl_board)

    it "exists" do
      expect(carl).to be_an_instance_of(CarlComputer)
    end
  end
end


# Attempt #1

# require 'rspec'
# require './lib/ship'
# require './lib/cell'
# require './lib/board'
# require './lib/game'
# require './lib/turn'
# require './lib/carl_computer'
#
# describe CarlComputer do
#   describe "initialize" do
#     carl = CarlComputer.new
#
#     xit "exists" do
#       expect(carl).to be_an_instance_of(CarlComputer)
#     end
#   end
# end
#
# describe "board" do
#     carl = CarlComputer.new
#     board = Board.new
#
#     xit "has a board" do
#       board.cell_creation
#       expect(carl.board.cells.size).to eq(16)
#     end
#
#     xit "can display a board" do
#       expected = "  1 2 3 4 \nA . . . .\nB . . . .\nC . . . .\nD . . . .\n"
#       expect(carl.board.render(true)).to eq(expected)
#     end
#   end
# end
