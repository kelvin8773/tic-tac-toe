module UserInterface

  

  def getInput(textname, input=false)
    texts ={
      'input' => "Please enter your position (1 - 9) or press 'q' to exit game:",
      'taken' => "Try again, that spot has been taken already.\n" ,
      'valid' => "Please enter an valid number, thanks!",
      'play' => "Would you like to play again?(y/n)?" ,
      'win' => "congrate! You won!",
      'full' => "Game board is full!",
      'playerOne' => "Player one please input your name: ",
      'playerTwo' => "Player two please input your name: ",
      'finish' => "Thank you to play!"
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
              getInput('taken')
              @board.show
              next
          end
          return pos 
      elsif input == "q"
        getInput('finish')
        exit
      end
      getInput('valid')
      @board.show
    end
  end

  def playAgain?   
    if getInput('play', true) == "y"
      return true
  else
    getInput('finish')
    sleepy
    exit
  end
      return false
  end

  def sleepy
    sleep 1
  end

end

  