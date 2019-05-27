load '../lib/board.rb'
load '../lib/player_interface.rb'

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game = GameBoard.new(positions) 
player1 = Player.new('X', 'Kelvin', positions)
player2 = Player.new('O', 'Denis', positions)

until game.if_full?
  game.display(positions)
  
  player1.play_game(positions)
  positions = player1.positions
  
  game.display(positions)

  player2.play_game(positions)
  positions = player2.positions

end


  
