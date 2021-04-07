require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

describe Game do
  describe 'initialize' do
    board = Board.new
    game = Game.new
    carl_board = Board.new
    carl_computer = CarlComputer.new(carl_board)
    player_shots = board.cells.keys
    cheat = false

    it 'exists' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'has correct amount of cells for board' do
      expect(game.board.cells.count).to eq(16)
    end

    it 'has correct amount of cells for carls board' do
      expect(carl_computer.carl_board.cells.count).to eq(16)
    end

    it 'can have player shots' do
      expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
      expect(game.player_shots).to eq(expected)
    end

    it 'can not cheat by defalut' do
      expect(game.cheat).to eq(false)
    end
  end

end
