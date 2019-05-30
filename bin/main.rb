require '../lib/board.rb'
require '../lib/player.rb' 
require '../lib/game.rb'

game_status = "play"

until game_status == "finish"
  
  if game_status == "play"
    positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    game = Game.new(positions) 
    playerOne = true
    
    player1 = Player.new()   
    puts "Player 1, Please Inputer your Name: "
    player1.name = gets.chomp

    player2 = Player.new()
    puts "Player 2, Please Inputer your Name: "
    player2.name = gets.chomp
  end

  if playerOne
    player1.inputs = game.play_game("X", player1.name, positions, player1.inputs)
    game_status = game.check_game_finish(player1.name, positions, player1.inputs)
    playerOne = false
  else
    player2.inputs = game.play_game("O", player2.name, positions, player2.inputs)
    game_status = game.check_game_finish(player2.name, positions, player2.inputs)
    playerOne = true
  end

end