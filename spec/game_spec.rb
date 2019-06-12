require 'colorize'  # Need to run 'gem install colorize'

require "./lib/game"
require "./lib/player"
require "./lib/board"

RSpec.describe Game do
    let (:player1) { Player.new('Kelvin', 'X'.red)}
    let (:player2) { Player.new('Denis', 'O'.green)}
    let (:board) { Board.new }
    let (:game) {Game.new(player1,player2,board)}
  
  describe "#game_finish?" do

    it "return true when board is full" do
      allow(board).to receive(:full?){true}
           
      expect(game.game_finish?).to be true
    end
  end

  describe "#check_win?" do
      it "return true if player1 win" do
      allow(player1).to receive(:inputs) {[1,2,3]}
      allow(player2).to receive(:inputs) {[4,7,8]}

      allow(board).to receive(:full?){false}
      allow(board).to receive(:win?){true}

      expect(game.check_win?(player1)).to be true
    end

      it "return true if player2 win" do
      allow(player1).to receive(:inputs) {[4,7,8]}
      allow(player2).to receive(:inputs) {[1,2,3]}

      allow(board).to receive(:full?){false}
      allow(board).to receive(:win?){true}

      expect(game.check_win?(player2)).to be true
    end
  end

end
