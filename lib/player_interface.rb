class Player
    attr_accessor :positions
    attr_reader :character, :name

    def initialize(char, name,positions)
        @char = char
        @name = name
        @positions = positions
    end

    def play_game(positions)
     puts "#{name}, Please enter your position (1 - 9) :"
     pos = gets.chomp
     pos = pos.to_i - 1
     positions[pos] = @char
    end
end