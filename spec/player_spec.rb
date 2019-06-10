require "./lib/interface"
require "./lib/player"

RSpec.describe Player do
  player = Player.new("kelvin", "X")
  
  describe "#initialize" do
    it "check name is Kelvin" do
      expect(player.name).to eql('kelvin')
    end

    it "check player's inputs is empty" do
      expect(player.inputs).to eql([])
    end

    it "check char is X" do
      expect(player.char).to eql('X')
    end
  end

  describe "#move" do
    it "check if input adding up" do
      expect(player.move(8)).to eql(player.inputs)
    end
  end
end