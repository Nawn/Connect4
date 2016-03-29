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
end