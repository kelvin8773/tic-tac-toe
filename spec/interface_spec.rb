require "./lib/interface"

RSpec.describe Interface do

    include Interface
    
    describe '#show_text' do
        it "return welcome messages" do 
            expect{show_text('welcome')}.to output("Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n").to_stdout
        end
        it "return board full messages" do 
            expect{show_text('full')}.to output(/Game board is full!/).to_stdout
        end
        it "return finish messages" do 
            expect{show_text('finish')}.to output("Thanks for your time! \n").to_stdout
        end
    end
    
    describe "#valid_number?" do
        it "return false if input is not a valid number" do
            expect(valid_number?('22')).to be false
        end

        it "return true if it is a valid number" do
            expect(valid_number?('1')).to be true
        end
    end    

end
