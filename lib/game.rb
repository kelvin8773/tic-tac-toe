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
        loop do   
            restart if @status == "initial"
            until game_finish? 
                next_move(@player1) if !game_finish?
                break if game_finish?
                next_move(@player2) if !game_finish?
            end 
            break if !play_again?
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
  
    def game_finish?
       has_won?(@player1)|| has_won?(@player2) || @board.full?
    end

    def has_won?(player)
        if @board.win?(player.inputs)
            print "#{player.name}, "  
            getInput('win')
            show(@board.positions)
            return true  
        end
    end


end 
