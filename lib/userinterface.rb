module UserInterface

  

  def getInput(textname, input=false)
    texts ={
      'input' => "Please enter your position (1 - 9) or press 'q' to exit game:",
      'taken' => "Try again, that spot has been taken already.\n" ,
      'valid' => "Please enter an valid number, thanks!",
      'play' => "Would you like to play again?(y/n)?" ,
      'win' => "Congrate! You won!",
      'full' => "Game board is full!",
      'name' => "Please input your Name: ",
    } 
    puts texts[textname] 
    if input
      return gets.chomp
    end

  end


  def checkTaken?(positions, index)
     positions[index] == "X" || positions[index] == "O"
  end   

  def checkValidNumber?(input)
      regex = /^[1-9]$/
      regex.match?(input)
  end

  def getPosition(player,positions)
    loop do 
      print "#{player}, "
      input = getInput('input', true)
      if checkValidNumber?(input)
          pos = input.to_i 
          if checkTaken?(positions,pos-1)
              getInput('Taken')
              next
          end
          return pos 
      elsif input == "q"
        exit
      end
      getInput('valid')
    end
  end

  def playAgain?   
    if getInput('play') == "y"
      return true
    end
      return false
  end
  

end

  