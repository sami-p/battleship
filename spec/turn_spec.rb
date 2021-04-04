require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/turn'

describe Turn do
  describe "initialize" do
    board = Board.new
    game = Game.new(board)
    turn = Turn.new

    it "exists" do
      expect(turn).to be an_instance_of(Turn)
    end
  end
end
