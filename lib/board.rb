module Board

  def display(positions)
    puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
    puts ""
  end

  def checkInputValidation(player,positions)

    loop do 
      puts "#{player}, Please enter your position (1 - 9) :"
      input = gets.chomp
      regex = /^[1-9]$/
      if regex.match?(input)
          index = input.to_i - 1
          if positions[index] == "X" || positions[index] == "O"
              puts("Try again, that spot has been taken already.\n\n") 
              next
          end
          return index
      end           
      puts "Enter valid number"
    end

  end

end