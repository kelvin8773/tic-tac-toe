   class Game
    include Board

    attr_accessor :positions

    def initialize(positions)
        @positions = positions 
        @lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ]
        inputOne = []
        inputTwo = []  

    end

    def play_game(char, player, positions, inputs=[])
        
        display(positions)

        index = checkInputValidation(player, positions)

        inputs << index + 1
        positions[index] = char

        

        return inputs
        
    end
    
    def if_full?
        @positions.all?{|x| x.instance_of?(String)}
    end

    def wins?(inputs)
        @lines.any?{|x| x - inputs == []}
    end
        
    def ask_name()
            puts "Please enter your name: "
            player = gets.chomp
    end

    def check_game_finish(inputs, positions, player)
        if wins?(inputs)
            display(positions)
            puts "You win #{player}!"
            puts "#{player}, would you like to play again?(y/n)?" 
            play_again = gets.chomp
            if play_again == "y"
                positions = [1,2,3,4,5,6,7,8,9]
                inputs = []
            end
            return true
        elsif if_full?
            puts "Game board is full!"
            puts "#{player}, would you like to play again?(y/n)?" 
            play_again = gets.chomp
            if play_again == "y"
            positions = [1,2,3,4,5,6,7,8,9]
            inputs = []
            end
            return true
        end
        return false
    end



end 
