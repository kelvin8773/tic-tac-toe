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
        
    def check_game_finish(player, positions, inputs)
        if wins?(inputs)
            display(positions)
            puts "You win #{player}!"  
            return "play" if play_again?(player)
            return "finish"
        elsif if_full?
            display(positions)
            puts "Game board is full!"
            return "play" if play_again?(player)
            return "finish"
        end
        return "continue"
    end

    def play_again?(player)
        puts "#{player}, would you like to play again?(y/n)?" 
        play_again = gets.chomp
        if play_again == "y"
            return true
        end
        false
    end

end 
