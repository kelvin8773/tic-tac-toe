   
class Game
    attr_accessor :positions

    def initialize(positions)
        @positions = positions 
        @lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ] 
    end

    def play_game(char, player, positions, input=[])
        
        self.display(positions)

        pos = nil
        index = 0

        loop do 
            puts "#{player}, Please enter your position (1 - 9) :"
            pos = gets.chomp
            regex = /^[1-9]$/
            if regex.match?(pos)
                index = pos.to_i
                index -= 1  
                if positions[index] == "X" || positions[index] == "O"
                    puts("Try again, that spot has been taken already.\n\n") 
                    next
                end
                break
            end           
            puts "Enter valid number"
        end

        input << pos.to_i
        positions[index] = char
    
        return input
        
    end


    def display(positions)
        puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
        puts "\t ---|---|---"
        puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
        puts "\t ---|---|---"
        puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
        puts ""
    end

    
    def if_full?
        @positions.all?{|x| x.instance_of?(String)}
    end


    def wins?(input)
        @lines.any?{|x| x - input == []}
    end
        
end 
