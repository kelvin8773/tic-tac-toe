class Player 
  include Interface

  attr_accessor :name, :inputs, :char

  def initialize(name, inputs=[], char)
    @name = name
    @inputs = inputs
    @char = char
  end

  def initial  
    if @name.start_with?('player')
      @name = getInput('name')
    end
    @inputs = []
  end

  def update(input)
    @inputs << input
  end

end
  