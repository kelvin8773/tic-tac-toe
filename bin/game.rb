load '../lib/game_logic.rb'

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game = Game.new(positions) 

until game.if_full?
  game.display(positions)
  
  game.play_game("X", "One", positions)

  if game.wins?
    puts "You win! One"
    break;
  end
  
  game.display(positions)
  
  game.play_game("O", "Two", positions)

  if game.wins?
    puts "You win! Two"
    break;
  end
  
end


  
