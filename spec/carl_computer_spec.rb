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
