class Game
    include UserInterface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @status = "play"
        # @who = @palyer1
    end

    def gameInitialize
        @player1.initial
        @player1.getName
        @player2.initial
        @player2.getName
        @board.initial
    end


    def playGame
        until @status == "finish"
            
            if @status == "play"
                gameInitialize
                @status = "continues"
            end

            play(@player1, "X")
            play(@player2, "O")

        end
    end

    def play(player, char)
        @board.show
        index = getInput(player.name, @board.positions)
        player.inputs << index + 1
        @board.positions[index] = char 
        
        if finish?
            if playAgain?
                @status = "play"
            else
                @status = "finish"
            end
        end

    end

  

    def finish?
        if @board.wins?(@player1.inputs) || @board.wins?(@player2.inputs)
            @board.show
            puts "You win !" 
            return  true
        elsif @board.if_full?
            @board.show
            puts "Game board is full!"
            return true
        end
    end
    
    def playAgain?
        puts "Would you like to play again?(y/n)?" 
        input = gets.chomp
        if input == "y"
            return true
        end
        false
    end

end 
