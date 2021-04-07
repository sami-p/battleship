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

    it 'can not cheat by defalut' do
      expect(game.cheat).to eq(false)
    end
  end

end
