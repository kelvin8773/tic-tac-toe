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

  def restartBoard
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update(input, char)
    @positions[input-1] = char
  end

  def full?
    if @positions.all?{|x| x.instance_of?(String)}  
      getInput('full') 
      return true
    end
  end

  def win?(inputs)
     @lines.any?{|x| x - inputs == []}  
  end

  def taken?(input)
    @positions[input-1] == "X".red || @positions[input-1] == "O".green
  end 
  
end