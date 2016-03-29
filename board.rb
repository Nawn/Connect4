class Board
	attr_reader :columns, :height

	def initialize(columns=7, height=6)
		c = columns.is_a? Integer
		h = height.is_a? Integer

		raise ArgumentError.new("Invalid input, only accepts 2 Integers") unless c && h
		
		@columns = Array.new(columns, [])
		@height = height
	end
end