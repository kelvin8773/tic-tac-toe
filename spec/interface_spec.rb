require "./lib/interface"

RSpec.describe Interface do
    # describe "#show" do
    #     it "Display the board positions" do
    #         expect(show([1,2,3,4,5,6,7,8,9])).to output
    #     end
    # end

    include Interface
    
    # describe "#get_input" do
    #     # it "Display text when game is finished" do
    #     #     expect(get_input('finish')).to output("Thanks for your time! \n")
    #     # end

    #     # it "Display text when you have to enter position" do
    #     #     expect(get_input('position')).to eql(gets.chomp)
    #     # end

    #     # it "Display text when you quit game" do
    #     #     expect(get_input('quit')).to output("Sorry to see you go, see you next time! \n")
    #     # end
    # end
    
    describe "#valid_number?" do
        it "return false if input is not a valid number" do
            expect(valid_number?('22')).to be false
        end

        it "return true if it is a valid number" do
            expect(valid_number?('1')).to be true
        end
    end

end
