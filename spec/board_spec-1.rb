require './lib/interface'
require './lib/board'

RSpec.describe Board do
  board = Board.new

  describe "#update" do
    it "update positions with X" do
      board.update(4, 'X')
      expect(board.positions[4-1]).to eql('X')
    end
  end
  
  describe "#full?" do  
    board.positions = ['x','x','o','z','x','x','s','o','x']

    it "return true if it is full" do
      expect(board.full?).to be true
    end
  end

  describe "#win?" do
    player1 = double('player')
    player2 = double('player')

    alow(player1).to receive(:name) ('kelvin')
    
    alow(player2).to receive(:name) ('denis')

   
  end


end