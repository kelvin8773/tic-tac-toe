module Interface

  def getInput(text)
    texts ={
      'position' => "Please enter your position (1 - 9) or press 'q' to exit game: \n",
      'play?' => "Would you like to play again?(y/n)?\n" ,
      'taken' => "Try again, that spot has been taken already.\n" ,
      'valid' => "Please enter an valid number, thanks! \n",
      'win' => "congrate! You won!\n",
      'full' => "Game board is full!\n",
      'name' => "Please input your name for",
      'welcome' => "Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n",
      'finish' => "Thank you to play! \n",
    } 

    print texts[text] 
    
    case text
    when 'position'
      return gets.chomp
    when 'play?'
      input = gets.chomp
      return input == "y"
    when 'name' 
      print "(#{@name}):"
      return gets.chomp
    else
      return false
    end

  end

  def validNumber?(input)
      regex = /^[1-9]$/
      regex.match?(input)
  end

end

  