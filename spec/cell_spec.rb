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
      expect(cell.ship).to eq(nil)
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

  describe "fired upon" do
    cell = Cell.new("B4")

    it "can report fired upon status" do
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq(false)
    end

    it "can fire upon a cell" do
      cell.fire_upon

      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
  end

  describe "render" do
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    it "can tell if the cell has not been fired upon" do
      expect(cell_1.render).to eq(".")

      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
    end

    it "can show a ship is in the cell" do
      cell_2.place_ship(cruiser)

      expect(cell_2.render).to eq(".")
    end

    it "can show where the ship is" do
      expect(cell_2.render(true)).to eq("S")
    end

    it "can show a hit" do
      cell_2.fire_upon

      expect(cell_2.render).to eq("H")
    end

    it "is not sunk yet" do
      expect(cruiser.sunk?).to eq(false)
    end

    it "can show it is sunk" do
      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end
end
