load '../lib/game_logic.rb'

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game = Game.new(positions) 
inputOne = []
inputTwo = []

until game.if_full?
  game.display(positions)
  
  inputOne = game.play_game("X", "One", positions, inputOne)
  p inputOne

  if game.wins?(inputOne)
    puts "You win! One"
    break;
  end
  
  game.display(positions)
  
  inputTwo = game.play_game("O", "Two", positions,inputTwo)
  # p inputTwo

  if game.wins?(inputTwo)
    puts "You win! Two"
    break;
  end
  
end


  
