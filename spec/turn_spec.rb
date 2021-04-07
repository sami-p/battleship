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
      expect(turn).to be_an_instance_of(Turn)
    end
  end

  describe "turns" do
    it "takes user's turns" do
        turn = Turn.new
    end
  end
end
