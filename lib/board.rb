class GameBoard
    attr_accessor :positions

    def initialize(positions)
        @positions = positions
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


end

   

