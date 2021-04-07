require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

describe Game do
  describe 'initialize' do
    board = Board.new
    game = Game.new

    it 'exists' do
      expect(game).to be_an_instance_of(Game)
    end

    it 'has a board' do
      expect(game.board.cells.count).to eq(16)
    end
  end

end
