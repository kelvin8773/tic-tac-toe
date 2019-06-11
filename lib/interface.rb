module Interface

  def show(positions)
    puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts ""
  end

  def show_text(text)
    texts ={
      'position' => "Please enter your position (1 - 9) or press 'q' to exit game: \n",
      'play?' => "Would you like to play again?(y/n)?\n" ,
      'taken' => "Try again, that spot has been taken already.\n" ,
      'valid' => "Please enter an valid number, thanks! \n",
      'win' => "congrate! You won!\n",
      'full' => "Game board is full!\n",
      'name' => "Please input your name for",
      'welcome' => "Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n",
      'finish' => "Thanks for your time! \n",
      'quit' => "Sorry to see you go, see you next time! \n"
    } 
    print texts[text] 
  end

  def get_input(text, default="")
    show_text(text)  

    case text
      when 'play?'
        return gets.chomp == "y"
      when 'name' 
        print "(#{default}):"
        return gets.chomp 
      else
        return gets.chomp
    end
  end

  def valid_number?(input)
      regex = /^[1-9]$/
      regex.match?(input)
  end


  def next_move(player, board=@board)
    loop do  
        print "#{player.name}, "            
        show_text('position')
        input = gets.chomp

        if valid_number?(input)
            input = input.to_i
            if board.taken?(input)
                show_text('taken') 
            else
                player.move(input)
                board.update(input, player.char)
                show(board.positions)   
                break
            end
        else   
          if input == "q"              
            show_text('quit')
            exit
          end 
           show_text('valid')
        end    
        show(board.positions)      
    end    
  end



  def winner_display(name, positions)
    print "#{name}, "  
    show_text('win')
    show(positions)
  end

  

end

  