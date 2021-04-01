require 'rspec'
require './lib/ship'
require './lib/board'
require './lib/cell'

describe Board do
  describe 'initialize' do
    board = Board.new
    it 'exists' do
      expect(board).to be_a Board
    end
  end
end
