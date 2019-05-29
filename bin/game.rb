load '../lib/game_logic.rb'

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game = Game.new(positions) 
inputOne = []
inputTwo = []
name_1 = ""
name_2 = ""

until game.if_full?
  
  if name_1 == ""
    puts "Player 1 enter your name: "
    name_1 = gets.chomp
  end

  if name_2 == ""
    puts "Player 2 enter your name: "
    name_2 = gets.chomp
  end

  game.display(positions)

  inputOne = game.play_game("X", name_1, positions, inputOne)
  p inputOne

  if game.wins?(inputOne)
    puts "You win #{name_1}!"
    game.display(positions)
    break;
  end
  
  game.display(positions)

  
  inputTwo = game.play_game("O", name_2, positions,inputTwo)
  # p inputTwo

  if game.wins?(inputTwo)
    puts "You win #{name_2} !"
    game.display(positions)
    break;
  end
  
end


  
