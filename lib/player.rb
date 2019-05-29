class Player 
  attr_accessor :name, :inputs

  def initialize(name=nil, inputs=[])
    @name = name
    @inputs = inputs
  end


  def updateInputs(input)
    inputs << input
  end

end
  