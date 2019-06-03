class Player 
  include UserInterface

  attr_accessor :name, :inputs, :char

  def initialize(name=nil, inputs=[], char)
    @name = name
    @inputs = inputs
    @char = char
  end

  def initial
    @name = ""
    @inputs = []
  end

  def getName
    @name = getInput('name', true)
  end

  def update(input)
    @inputs << input
  end

end
  