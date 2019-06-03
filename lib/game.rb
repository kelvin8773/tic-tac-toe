class Game
    include UserInterface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @status = "initial"
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

            [@player1, @player2].each do |player| 

                checkStatus?(player.inputs)

                @board.show
                
                position = getPosition(player.name, @board.positions)
                
                player.update(position)
                
                @board.update(position-1, player.char)
                
                checkStatus?(player.inputs)

        end
           
        end
    end

    
    def checkStatus?(inputs)
        case @status
        when "initial"
            @status = "continues"
            gameInitialize
            return false
        when "continues"
            if @board.check?(inputs)
                if playAgain?
                    @status = "initial"
                    gameInitialize
                    @status = "continues"
                    return false
                else
                    @status = "finish"
                    return true
                end
            end
        end
        
    end

end 
