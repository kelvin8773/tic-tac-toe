class Game
    include Interface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @status = "initial"
    end

    def play
        getInput('welcome')
  
        until @status == "finish" && !play_again?
            restart if @status == "initial"
            next_move(@player1) if !game_finish?
            next_move(@player2) if !game_finish?
        end 
          
        finish 
    end

    private

    def restart
        @player1.restartPlayer
        @player2.restartPlayer
        @board.restartBoard
        @status = "continue"               
        show(@board.positions)  
    end

    def next_move(player)
        loop do  
            print "#{player.name}, "            
            input = getInput('position')

            if validNumber?(input)
                input = input.to_i
                if @board.taken?(input)
                    getInput('taken') 
                else
                    player.move(input)
                    @board.update(input, player.char)
                    show(@board.positions)   
                    break
                end
            else   
                finish if input == "q"              
                getInput('valid')
            end    
            show(@board.positions)      
        end    
    end

    def game_finish?
       if has_won?(@player1)|| has_won?(@player2) || @board.full?
            getInput('full') if @board.full?
            @status = "finish"
            return true
       end
    end

    def has_won?(player)
        if @board.win?(player.inputs)
            print "#{player.name}, "  
            getInput('win')
            show(@board.positions)
            return true  
        end
    end


    def play_again?   
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
