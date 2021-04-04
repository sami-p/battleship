require 'rspec'
require './lib/ship'
require './lib/board'
require './lib/cell'

describe Board do
  describe "initialize" do
    board = Board.new

    it "exists" do
      expect(board).to be_a Board
    end

    it "creates cells" do

      board.cell_creation

      expect(board.cells.size).to eq(16)
    end
  end

  describe "valid coordinate" do
    board = Board.new

    it "validates coordinate to true" do
      expect(board.valid_coordinate?("A1")).to eq(true)
      expect(board.valid_coordinate?("D4")).to eq(true)
    end

    it "validates coordinate to false" do
      expect(board.valid_coordinate?("A5")).to eq(false)
      expect(board.valid_coordinate?("E1")).to eq(false)
      expect(board.valid_coordinate?("A22")).to eq(false)
    end
  end

  describe "valid placement" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    it "can validate coordinates to false" do
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it "coordinates must be consecutive" do
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it "coordinates can not be diagonal" do
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it "coordinates to true" do
      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  describe "place" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    it "can place ship" do

      board.place(cruiser, ["A1", "A2", "A3"])

      cell_1 = board.cells["A1"]
      cell_2 = board.cells["A2"]
      cell_3 = board.cells["A3"]

      expect(cell_1.ship).to eq(cruiser)
      expect(cell_2.ship).to eq(cruiser)
      expect(cell_3.ship).to eq(cruiser)

      expect(cell_3.ship) == cell_2.ship
    end
  end

  describe 'overlap' do
    it 'does not have overlapping ships' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      board.place(cruiser, ["A1", "A2", "A3"])

      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
      expect(board.not_overlapping(["A1", "B1"])).to eq(false)
    end
  end

  describe "render" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    it 'renders board' do
      expected = " 1 2 3 4 \nA    . . . .\nB    . . . .\nC    . . . .\nD    . . . .\n"

      expect(board.render).to eq(expected)
    end

    it 'renders true' do
      board.place(cruiser, ["A1", "A2", "A3"])
      expected = " 1 2 3 4 \nA    S S S .\nB    . . . .\nC    . . . .\nD    . . . .\n"
      
      expect(board.render(true)).to eq(expected)
    end
  end
end
