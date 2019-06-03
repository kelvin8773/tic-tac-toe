module UserInterface

  def display(positions)
    puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts ""
  end

  def checkTaken?(positions, index)
     positions[index] == "X" || positions[index] == "O"
  end   

  def checkValidNumber?(input)
      regex = /^[1-9]$/
      regex.match?(input)
  end


  def getInput(player,positions)
    loop do 
      puts "#{player}, Please enter your position (1 - 9) :"
      puts "press 'q' to exit game"
      input = gets.chomp
      
      if checkValidNumber?(input)
          index = input.to_i - 1
          if checkTaken?(positions,index)
              puts "Try again, that spot has been taken already.\n\n"
              next
          end
          return index  
      elsif input == "q"
        exit
      end
        puts "Enter valid number"
    end

  end

  def playAgain?
    puts "Would you like to play again?(y/n)?" 
    input = gets.chomp
    if input == "y"
      return true
      end
      false
  end

end

  