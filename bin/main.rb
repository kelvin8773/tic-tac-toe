require 'colorize'  # Need to run 'gem install colorize'

# self customized libary
require './lib/interface'
require './lib/board'
require './lib/player' 
require './lib/game'


player1 = Player.new("player1", "X".red)
player2 = Player.new("player2", "O".green)
board = Board.new
game = Game.new(player1, player2, board)

game.play



