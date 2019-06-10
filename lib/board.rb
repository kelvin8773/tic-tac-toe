class Board
  include Interface

  attr_reader :lines
  attr_accessor :positions

  def initialize(positions)
    @positions = positions
    @lines = [
          [1,2,3],[4,5,6],[7,8,9],
          [1,4,7],[2,5,8],[3,6,9],
          [1,5,9],[3,5,7]
         ]
  end


  def update(input, char)
    @positions[input-1] = char
  end

  def full?
    @positions.all?{|x| x.instance_of?(String)}     
  end

  def win?(player, board)
     board.lines.any?{|x| x - player.inputs == []} 
  end

  def taken?(input)
    @positions[input-1] == "X".red || @positions[input-1] == "O".green
  end 
  
end