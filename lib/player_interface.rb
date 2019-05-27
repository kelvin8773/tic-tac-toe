class Player
    attr_accessor :position
    attr_reader :character, :name

    def start_game()
     puts "Please enter your position (1 - 9) :"
     pos = gets.chomp
     position[pos] = "X"
     puts "Please enter your position (1 - 9) :"  
      pos = gets.chomp 
     position[pos] = “O”
end