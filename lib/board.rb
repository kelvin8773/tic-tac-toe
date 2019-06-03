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
    puts "\t  #{@positions[6]} | #{@positions[7]} | #{@positions[8]}"
    puts "\t ---|---|---"
    puts "\t  #{@positions[3]} | #{@positions[4]} | #{@positions[5]}"
    puts "\t ---|---|---"
    puts "\t  #{@positions[0]} | #{@positions[1]} | #{@positions[2]}"
    puts ""
  end

  def update(index, char)
    @positions[index] = char
  end

  def check?(inputs)
    if isFull? 
      getInput('full')
      return true
    elsif wins?(inputs)
      # print "#{name}, " 
      getInput('win') 
      return true
    end  
    return false
  end


  def isFull?
    @positions.all?{|x| x.instance_of?(String)}  
  end

  def wins?(inputs)
     @lines.any?{|x| x - inputs == []}  
  end
  
end