class Game
    include Interface

    attr_reader :quit
    attr_accessor :player1, :player2, :board

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @quit = false
    end

    def play
        show(@board.positions)
        loop do
        
            game_finish? ? break : next_move(@player1) ?  'next' : break
            game_finish? ? break : next_move(@player2) ?  'next' : break
        end 
        return get_input('play?') == 'y'
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

    def next_move(player)
     loop do
        input = get_next_move(player.name)
        case input
        when 'invalid'
            next
        when "quit"
            return false
        else
            return true if update_input(input, player, @board)
            next
        end
     end
    end

end 
