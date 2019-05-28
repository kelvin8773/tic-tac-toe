   
class Game
    attr_accessor :positions
    # attr_reader :character, :player

    def initialize(positions)
        @positions = positions 
        @lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ] 
    end


    def play_game(char, player, positions)
     puts "#{player}, Please enter your position (1 - 9) :"
     pos = gets.chomp
     pos = pos.to_i - 1
     positions[pos] = char
        if (1..9).include?(pos)
            self.is_fulled?(pos) ? puts("Try again, that spot has been taken already.\n\n") : pos
        else
            puts "Enter valid number"
        end 
    end

    def display(positions)
        puts "\t  #{positions[6]} | #{positions[7]} | #{positions[8]}"
        puts "\t ---|---|---"
        puts "\t  #{positions[3]} | #{positions[4]} | #{positions[5]}"
        puts "\t ---|---|---"
        puts "\t  #{positions[0]} | #{positions[1]} | #{positions[2]}"
        puts ""
    end

     def fill_board(pos, char)
        @positions[pos] = char
    end

    def if_full?
        @positions[0..8].all?{|x| x.instance_of?(String)}
    end

     def is_fulled?(num)
        @positions[num] == "X" || "O" == @positions[num]
    end

    def wins?

        @line && @positions == @line
    end

    # def who_wins?(player)
    #     # Player.each{|player|
    #     #     @lines.each{|line|
    #     #         return Player.name() if Player.wins?(line)
    #     #     }
    #     # }

    #     if wins? 
    #         put "#{player}, you win!" if wins?


    #     false
    # end
        
end 
