class Player
  attr_reader :letter
  @@used = []

  def self.clean
    @@used = []
  end

  def initialize(input_letter = nil) 
    first_check = input_letter.is_a? Symbol
    second_check = input_letter.is_a? String
    raise ArgumentError.new("Requires character input") if input_letter.nil?
    raise ArgumentError.new("Input must be String or Symbol") unless first_check || second_check
    raise ArgumentError.new("Input must be only 1 character") unless input_letter.length == 1
    letter = input_letter.upcase.to_sym
    raise StandardError.new("Letter already in use") if @@used.include? letter
    @letter = letter
    @@used << letter
  end
end