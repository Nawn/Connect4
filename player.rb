class Player
  attr_reader :letter

  def initialize(input_letter = nil) 
    raise ArgumentError.new("Requires character input") if input_letter.nil?
    letter = input_letter.upcase.to_sym
    @letter = letter
  end
end