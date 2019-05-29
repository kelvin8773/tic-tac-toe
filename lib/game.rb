   
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
        
end 
