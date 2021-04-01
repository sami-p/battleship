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

  describe 'valid coordinate' do
    board = Board.new

    it 'validates coordinate to true' do
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
    end

    it 'validates coordinate to false' do
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end
end
