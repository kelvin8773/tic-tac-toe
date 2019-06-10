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
    show(@positions)
  end


  def update(input, char)
    @positions[input-1] = char
  end

  def full?
    if @positions.all?{|x| x.instance_of?(String)}  
      get_input('full') 
      return true
    end
    return false
  end

  def win?(player, board)
    if board.lines.any?{|x| x - player.inputs == []}
      winner_display(player.name, board.positions)
      return true
    end
    return false
  end

  def taken?(input)
    @positions[input-1] == "X".red || @positions[input-1] == "O".green
  end 
  
end