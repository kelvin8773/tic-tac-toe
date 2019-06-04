class Board
  include Interface

  attr_accessor :positions

  def initialize()
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @lines = [
          [1,2,3],[4,5,6],[7,8,9],
          [1,4,7],[2,5,8],[3,6,9],
          [1,5,9],[3,5,7]
         ]  
  end

  def initial
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show
    puts "\t  #{@positions[6]} | #{@positions[7]} | #{@positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{@positions[3]} | #{@positions[4]} | #{@positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{@positions[0]} | #{@positions[1]} | #{@positions[2]}"
    puts ""
  end

  def update(input, char)
    @positions[input-1] = char
  end

  def full?
    @positions.all?{|x| x.instance_of?(String)}  
  end

  def win?(inputs)
     @lines.any?{|x| x - inputs == []}  
  end

  def taken?(input)
    @positions[input-1] == "X" || @positions[input-1] == "O"
  end 
  
end