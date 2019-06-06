module Interface

  def show(positions)
    puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts ""
  end

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

  def next_move(player)
    loop do  
        print "#{player.name}, "            
        input = getInput('position')

        if validNumber?(input)
            input = input.to_i
            if @board.taken?(input)
                getInput('taken') 
            else
                player.move(input)
                @board.update(input, player.char)
                show(@board.positions)   
                break
            end
        else   
            finish if input == "q"              
            getInput('valid')
        end    
        show(@board.positions)      
    end    
  end

  def play_again?   
    if getInput('play?')    
        @status = "initial"
        return true
    end
  end

  def finish
    getInput('finish')
    sleep 1
    exit
  end

end

  