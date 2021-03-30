require 'rspec'
require './lib/ship'
require './lib/cell'

describe Cell do
  describe "initialize" do
    cell = Cell.new("B4")

    it "it exists" do
      expect(cell).to be_a(Cell)
    end

    it "has a coordinate" do
      expect(cell.coordinate).to eq("B4")
    end

    it "has no ships" do
      expect(cell.ship).to be(nil)
    end

    it "is empty" do
      expect(cell.empty?).to eq(true)
    end
  end

  describe "ship placement into cell" do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    it "it can take a ship" do
      cell.place_ship(cruiser)

      expect(cell.ship).to eq(cruiser)
      expect(cell.empty?).to eq(false)
    end
  end
end
