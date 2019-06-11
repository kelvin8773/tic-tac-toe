class Game
    include Interface

    attr_accessor :player1, :player2, :board

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
    end

    def play
        show(@board.positions)
        loop do
            game_finish? ? break : next_move(@player1)
            game_finish? ? break : next_move(@player2)
        end 
        return get_input('play?')
    end

    # private
  
    def game_finish?(player1=@player1, player2=@player2, board=@board)
       if board.win?(player1.inputs)
        winner_display(player1.name, board.positions)
         return true
       elsif board.win?(player2.inputs) 
        winner_display(player2.name, board.positions)
        return true
       elsif board.full?
        show_text('full') 
        return true
       end
    end

end 
