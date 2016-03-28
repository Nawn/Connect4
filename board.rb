class Board
	attr_reader :columns, :height
	def initialize(columns=7, height=6)
		@columns = Array.new(columns, [])
		@height = height
	end
end