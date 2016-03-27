require_relative 'spec_helper.rb'

describe Board do
	describe "#new" do
		it "Creates a board object" do
			board = Board.new
			expect(board).to be_instance_of Board
		end

		context "when given no input" do
			before (:each) do
				@board = Board.new
			end

			it "has 7 columns" do
				expect(@board.columns.length).to eql(7)
			end

			it "has 6 row height" do
				expect(@board.height).to eql(6)
			end
		end
	end
end