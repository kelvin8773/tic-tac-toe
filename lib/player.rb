class Player 
  attr_accessor :name, :inputs

  def initialize(name=nil, inputs=[])
    @name = name
    @inputs = inputs
  end

  def input_name
    @name = gets.chomp
  end

end
  