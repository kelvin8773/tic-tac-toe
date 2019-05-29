load '../lib/game_logic.rb'

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game = Game.new(positions) 
inputOne = []
inputTwo = []
name_1 = ""
name_2 = ""
game_on = true


until game_on == false
  
  if name_1 == ""
    puts "Player 1 enter your name: "
    name_1 = gets.chomp
  end

  if name_2 == ""
    puts "Player 2 enter your name: "
    name_2 = gets.chomp
  end

  inputOne = game.play_game("X", name_1, positions, inputOne)

  if game.wins?(inputOne)
    game.display(positions)
    puts "You win #{name_1}!"
    game_on = false
  elsif game.if_full?
    puts "Game board is full!"
    game_on = false
  end

  if game_on == false
    puts "#{name_1}, would you like to play again?(y/n)?" 
    play_again = gets.chomp
    if play_again == "y"
      positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      inputOne = []
      inputTwo = []
      game_on = true
      next
    end
    break
  end
  
  inputTwo = game.play_game("O", name_2, positions,inputTwo)
  
  if game.wins?(inputTwo)
    puts "You win #{name_2} !"
    game.display(positions)
    game_on = false
  elsif game.if_full?
    puts "Game board is full!"
    game_on = false
  end  
  
  if game_on == false
    puts "#{name_2}, would you like to play again?(y/n)?" 
    play_again = gets.chomp
    if play_again == "y"
      positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      inputOne = []
      inputTwo = []
      game_on = true
      next
    end
    break
  end

end


  
