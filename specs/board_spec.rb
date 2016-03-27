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

  describe "#turn" do
    before(:each) do
      @board = Board.new
    end

    context "when given no input" do
      it "raises an argument error" do
        expect{@board.turn()}.to raise_error(ArgumentError, "Input is required")
      end
    end

    context "when given wrong input" do
      context "Given Non-Array" do
        it "raises ArgumentError" do
          expect{@board.turn("okay sure")}.to raise_error(ArgumentError, "Input must be Array")
          expect{@board.turn(5)}.to raise_error(ArgumentError, "Input must be Array")
        end
      end

      context "When given incorrectly sized Array" do
        it "raises ArgumentError" do
          expect{@board.turn([2, :X, "Poop"])}.to raise_error(ArgumentError, "Array size must be 2")
          expect{@board.turn([2])}.to raise_error(ArgumentError, "Array size must be 2")
        end
      end

      context "When given inappropriate data types" do
        it "raises ArgumentError" do
          expect{@board.turn([5, "caca"])}.to raise_error(ArgumentError, "Must be Array with Integer, Symbol")
          expect{@board.turn([:X, 12])}.to raise_error(ArgumentError, "Must be Array with Integer, Symbol")
          expect{@board.turn(["5", ["caca"]])}.to raise_error(ArgumentError, "Must be Array with Integer, Symbol")
        end
      end
    end

    context "when given correct input" do
      #To-Do
    end
  end
end