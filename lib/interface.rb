module Interface

  def getInput(text)
    texts ={
      'position' => "Please enter your position (1 - 9) or press 'q' to exit game:",
      'play?' => "Would you like to play again?(y/n)?" ,
      'taken' => "Try again, that spot has been taken already.\n" ,
      'valid' => "Please enter an valid number, thanks!",
      'win' => "congrate! You won!",
      'full' => "Game board is full!",
      'playerOne' => "Please input your name for Player1: ",
      'playerTwo' => "Please input your name for Player2: ",
      'welcome' => "Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game!",
      'finish' => "Thank you to play!",
    } 

    puts texts[text] 
    
    case text
    when 'position'
      return gets.chomp
    when 'play?'
      input = gets.chomp
      return input == "y"
    when 'playerOne' 
      return gets.chomp
    when 'playerTwo'
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

  