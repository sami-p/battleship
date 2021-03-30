require 'rspec'
require './lib/ship'


RSpec.describe Ship do
  describe "initialize" do
    cruiser = Ship.new("Cruiser", 3)

    it "is a ship" do
      expect(cruiser).to be_an_instance_of(Ship)
    end

    it "has a name" do
      expect(cruiser.name).to eq("Cruiser")
    end

    it "has health" do
      expect(cruiser.health).to eq(3)
    end

    it "can provide its length" do
      expect(cruiser.length).to eq(3)
    end
  end

  describe "ship status" do
    cruiser = Ship.new("Cruiser", 3)

    it "is not sunk by default" do
      expect(cruiser.sunk?).to eq false
    end
  end
end
