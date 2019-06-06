class Player 
  include Interface

  attr_reader :char
  attr_accessor :name, :inputs

  def initialize(name, char)
    @name = name
    @inputs = []
    @char = char
  end

  def restartPlayer
    if @name.start_with?('player')
      @name = getInput('name')
    end
    @inputs = []
  end

  def move(input)
    @inputs << input
  end

end
  