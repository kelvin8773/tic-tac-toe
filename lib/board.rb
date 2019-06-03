class Board
  include UserInterface

  attr_accessor :positions, :lines

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
    display(@positions)
  end

  def isFull?
    @positions.all?{|x| x.instance_of?(String)}
  end

  def wins?(inputs)
    @lines.any?{|x| x - inputs == []}
  end
    

end