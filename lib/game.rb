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
        
        until checkStatus?

            [@player1, @player2].each do |player| 

                @board.show

                position = getPosition(player.name, @board.positions)
                
                player.update(position)
                
                @board.update(position-1, player.char)

                if @board.check?(player.inputs)
                    if playAgain?
                        @status = "initial"
                        next
                    else
                        @status = "finish"
                        next
                    end
                end
            
            end       
        end

    end

    
    def checkStatus?
        case @status
        when "initial"
            gameInitialize
            @status = "continues"
            return false
        when "continues"
            return false
        when "finish"
            return true   
        end
        
    end

end 
