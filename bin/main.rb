require '../lib/board.rb'
require '../lib/player.rb' 
require '../lib/game.rb'

positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
game = Game.new(positions) 
inputOne = []
inputTwo = []
name_1 = ""
name_2 = ""
game_finished = false


until game_finished == true
  
  if name_1 == "" || name_2 == "" 
  name_1 = game.ask_name()
  name_2 = game.ask_name()
  end

  inputOne = game.play_game("X", name_1, positions, inputOne)

  game_finished = game.check_game_finish(inputOne, positions, name_1)

  if game_finished == true
    puts "#{name_1}, would you like to play again?(y/n)?" 
    play_again = gets.chomp
    if play_again == "y"
      positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      inputOne = []
      inputTwo = []
      game_finished = false
      next
    end
    break
  end
  

  inputTwo = game.play_game("O", name_2, positions,inputTwo)
  
  game_finished = game.check_game_finish(inputTwo, positions, name_2)
  
  if game_finished == true
    puts "#{name_2}, would you like to play again?(y/n)?" 
    play_again = gets.chomp
    if play_again == "y"
      positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      inputOne = []
      inputTwo = []
      game_finished = false
      next
    end
    break
  end

end