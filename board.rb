class Board
	attr_reader :columns, :height

	def initialize(columns=7, height=6)
		c = columns.is_a? Integer
		h = height.is_a? Integer

		raise ArgumentError.new("Invalid input, only accepts 2 Integers") unless c && h
		
		@columns = Array.new(columns, [])
		@height = height
	end

	def turn(input_array = nil)
		raise ArgumentError.new("Input is required") if input_array.nil?
		raise ArgumentError.new("Input must be Array") unless input_array.is_a? Array
		raise ArgumentError.new("Array size must be 2") unless input_array.size == 2
		first = input_array[0].is_a? Integer 
		second = input_array[1].is_a? Symbol
		raise ArgumentError.new("Must be Array with Integer, Symbol") unless first && second
		raise ArgumentError.new("Column does not exist") if @columns[input_array[0]].nil?
		raise StandardError.new("Column Index: #{input_array[0]}, is full") if @columns[input_array[0]].size >= @height
		@columns[input_array[0]] += [input_array[1]]
	end

  def over?
    victory?() || @columns.any? do |column|
      column.any? {|current| current.nil?}
    end
  end

  def victory?
    @columns.each_with_index do |column, index|
      column.each_with_index do |sym, idx|
        return true if [sym, @columns[index+1][idx], @columns[index+2][idx], @columns[index+3][idx]].all? do |current|
          sym == current
        end

        return true if [sym, @columns[index][idx+1], @columns[index][idx+2], @columns[index][idx+3]].all? do |current|
          sym == current
        end

        right_diag = [sym, @columns[index+1][idx+1], @columns[index+2][idx+2], @columns[index+3][idx+3]].all? do |current| 
          sym == current
        end

        left_diag = [sym, @columns[index-1][idx+1], @columns[index-2][idx+2], @columns[index-3][idx+3]].all? do |current|
          sym == current
        end

        return true if right_diag || left_diag
      end
    end
    false
  end
end