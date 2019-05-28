class Player
    attr_accessor :positions
    attr_reader :character, :name

    def initialize(char, name,positions)
        @char = char
        @name = name
        @positions = positions 
        @lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ] 
    end


    def play_game(positions)
     puts "#{name}, Please enter your position (1 - 9) :"
     pos = gets.chomp
     pos = pos.to_i - 1
     positions[pos] = @char
     if(0..8)include?(pos)
        if display.is_fulled?(pos)
            puts "Try again, spot already token"
        else
            puts "Enter valid number"
        end
     end
    end

    def wins?(line)
    line & @positions == line
    end

    def who_wins?
        Player.each{|player|
            @lines.each{|line|
                return Player.name() if Player.wins?(line)
            }
        }
        false
    end
        
end 