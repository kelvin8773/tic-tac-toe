require 'colorize'  # Need to run 'gem install colorize'

require "./lib/game"
require "./lib/interface"
require "./lib/player"
require "./lib/board"

RSpec.describe Game do
    let (:player1) { Player.new('Kelvin', 'X'.red)}
    let (:player2) { Player.new('Denis', 'O'.green)}
    let (:board) { Board.new }
  
  describe "#game_finish?" do
    it "return true if player1 win" do
      game = Game.new(player1,player2,board)
      game.player1.move(2)
      game.player1.move(5)
      game.player1.move(8)
           
      expect(game.game_finish?).to be true
    end

    it "return false if player2 not win" do
      game = Game.new(player1,player2,board)
      game.player2.move(3)
      game.player2.move(6)
      game.player2.move(7)
           
      expect(game.game_finish?).to be_falsey
    end

    it "return true if board is full" do
      game = Game.new(player1,player2,board)
      game.board.positions = ['x', 'z', 'o', 'x', 'x', 'x', 'w', 'e', 'f']
           
      expect(game.game_finish?).to be_truthy
    end



  end

end
