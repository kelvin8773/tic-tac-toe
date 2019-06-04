class Player 
  include Interface

  attr_reader :char
  attr_accessor :name, :inputs

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
  