class Game
    include Interface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
    end

    def play
        show(@board.positions)
        until game_finish? 
            game_finish? ? break : next_move(@player1)
            game_finish? ? break : next_move(@player2)
        end 
        return play_again?
    end

    private
  
    def game_finish?
       if @board.win?(@player1, @board)
        winner_display(@player1.name, @board.positions)
         return true
       elsif @board.win?(@player2, @board) 
        winner_display(@player2.name, @board.positions)
        return true
       elsif @board.full?
        show_text('full') 
        return true
       end
    end

end 
