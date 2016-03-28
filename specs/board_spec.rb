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
      @empty_rows = []
      7.times do
        @empty_rows << []
      end
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
      it "does not raise error" do
        expect{@board.turn([4, :X])}.not_to raise_error
      end

      it "adds 1st index symbol to column" do
        expect(@board.columns).to eql(@empty_rows)
        @board.turn([2,:X])
        @empty_rows[2] << :X
        expect(@board.columns).to eql(@empty_rows)
      end

      context "when adding to non-existing column" do
        it "raises StandardError" do
          expect{@board.turn([9, :X])}.to raise_error(StandardError, "Column does not exist")
        end
      end

      context "when adding to a full column" do
        it "raises a Standard Error" do
          expect{@board.turn([4, :X])}.not_to raise_error
          @board.height-1.times do
            @board.turn([4, :X])
          end
          expect(@board.columns[4].size).to eql(6)
          expect{@board.turn([4, :X])}.to raise_error(StandardError, "Column Index: 4, is full")
        end
      end
    end
  end

  describe "#over?/#victory?" do
  	context "when there is room, and no one has won" do
  		before (:each) do
  			@board = Board.new
  		end

  		it "returns false" do
  			expect(@board.over?).to be false
  		end
  	end

  	context "when there is room, but a victory is reached" do
  		context "when victory is a 4 horizontal" do

  		end

  		context "when victory is a 4 vertical" do

  		end

  		context "when victory is 4 diagonal" do
  			context "when left diagonal" do

  			end

  			context "when right diagonal" do

  			end
  		end
  	end

  	context "when there is no room, and no victory" do

  	end
  end
end