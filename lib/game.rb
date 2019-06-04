class Game
    include Interface

    def initialize(player1, player2, board)
        @player1 = player1
        @player2 = player2
        @board = board
        @status = "initial"
    end

    def initial
        [@player1, @player2].each {|player| player.initial}
        @board.initial
    end

    def play
        getInput('welcome')
  
        loop do

            if @status == "initial"
                self.initial
                @status = "continue"               
                @board.show
            end
        
            [@player1, @player2].each do |player| 
    
                loop do
                    print "#{player.name}, "
                    
                    input = getInput('position')

                    if validNumber?(input)
                        input = input.to_i
                        if @board.taken?(input)
                            getInput('taken') 
                            next
                        else
                            player.update(input)
                            @board.update(input, player.char)
                            @board.show
                            break
                        end
                    else   
                        self.finish if input == "q"              
                        getInput('valid')
                    end    
                    @board.show         
                end

                if @board.win?(player.inputs) || @board.full?
                    print "#{player.name}, "  
                    getInput('full') if @board.full?
                    getInput('win') if @board.win?(player.inputs)
                    @board.show
                   
                    if self.playAgain
                        break
                    else
                        self.finish
                    end 
                end
            end  
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
