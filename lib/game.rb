class Game
    include UserInterface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @status = "play"
        @who = "One"
    end

    def gameInitialize
        player1.initial
        player2.initial
        board.initial
    end


    def playGame

        until @status == "finish"
            
            if status == "play"
                gameInitialize
            end

            if  who == "One"
                board.show
                index = getInput(player1.name, board.positions)
                player1.inputs << index + 1
                board.positions[index] = "X"  

            
                status = check_game_finish(player1.name, positions, player1.inputs)

                who = "Two"
            else
                player2.inputs = play_game("O", player2.name, board.positions, player2.inputs)
                status = check_game_finish(player2.name, positions, player2.inputs)
                who = "One"
            end
        end


    end

    
     
    def check_game_finish(player, positions, inputs)
        if wins?(inputs)
            board.show
            puts "You win #{player}!"  
            return "play" if play_again?(player)
            return "finish"
        elsif if_full?
            display(positions)
            puts "Game board is full!"
            return "play" if play_again?(player)
            return "finish"
        end
        return "continue"
    end

    def play_again?(player)
        puts "#{player}, would you like to play again?(y/n)?" 
        play_again = gets.chomp
        if play_again == "y"
            return true
        end
        false
    end

end 
