class Player 
  attr_accessor :name, :inputs

  def initialize(name=nil, inputs=[])
    @name = name
    @inputs = inputs
  end

  def initial
    @name = ""
    @inputs = []
  end

  def getName
    puts "Please Input your Name:"
    @name = gets.chomp
  end

end
  