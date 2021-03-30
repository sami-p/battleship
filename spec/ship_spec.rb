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
  end
end
