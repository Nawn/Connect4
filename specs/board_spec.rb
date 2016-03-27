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

    context "when given input" do
      before(:each) do
        @board = Board.new(10,15)
      end

      it "has first params number of columns" do
        expect(@board.columns.length).to eql(10)
      end

      it "has second param number of height" do
        expect(@board.height).to eql(15)
      end
    end

    context "When given invalid input type" do
      it "raises an Argument Error" do
        expect{Board.new(Array(1..10))}.to raise_error(ArgumentError, "Invalid input, only accepts 2 Integers")
      end
    end
	end
end