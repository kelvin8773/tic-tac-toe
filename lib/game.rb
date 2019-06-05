class Game
    include Interface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @status = "initial"
    end

    def restart
        @player1.restartPlayer
        @player2.restartPlayer
        @board.restartBoard
    end

    def play
        getInput('welcome')
  
        until gameFinish

            if @status == "initial"
                self.restart
                @status = "continue"               
                show(@board.positions)
            end

            checkInput(@player1)
            hasWon(@player1)
            checkInput(@player2)
            hasWon(@player2)
        end
        
    end

    def checkInput(player)
        print "#{player.name}, "
                    
        input = getInput('position')

        if validNumber?(input)
            input = input.to_i
        if @board.taken?(input)
            getInput('taken') 
        else
            player.move(input)
            @board.update(input, player.char)
        end
        else   
            self.finish if input == "q"              
            getInput('valid')
        end    
            show(@board.positions)         
    end

    def hasWon(player)
        if @board.win?(player.inputs)
            print "#{player.name}, "  
            getInput('win')
            show(@board.positions)  
        end
    end

    def gameFinish
        if @board.full?
            playAgain
        end
    end

    def playAgain    
        if getInput('play?')    
            @status = "initial"
            return true
        end   
    end

    def finish
        getInput('finish')
        sleep 1
        exit
    end

end 
