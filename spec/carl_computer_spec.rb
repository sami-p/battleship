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

    it "has cells" do
      expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
      expect(carl.carl_shots).to eq(expected)
    end
  end

  describe "ships" do
    carl_board = Board.new
    carl = CarlComputer.new(carl_board)

    it "can add ships" do
      carl.add_ships
      expect(carl.ships.length).to eq(2)
    end
  end
end
