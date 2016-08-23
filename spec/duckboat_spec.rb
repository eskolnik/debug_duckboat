require_relative "../lib/duckboat"
require 'pry'

RSpec.describe Duckboat do
  let(:new_boat) { Duckboat.new }

  describe "#terrestrial?" do
    it "returns true" do
      expect(new_boat.terrestrial?).to eq true
    end
  end

  describe "#has_engine?" do
    it "returns true" do
      expect(new_boat.has_engine?).to eq true
    end
  end

  describe "#captain" do
    it "returns the name of the captain" do
      expect(new_boat.captain.name).to eq "Nick"
    end
  end

end
