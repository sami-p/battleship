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
  end
end

# cell.ship
# # => nil
# cell.empty?
# # => true
# cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>
# cell.place_ship(cruiser)
# cell.ship
# # => #<Ship:0x00007f84f0891238...>
# cell.empty?
# # => false
