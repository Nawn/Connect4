require_relative 'spec_helper.rb'

describe Player do
  describe "#new" do
    context "when given input letter" do
      context "when input is symbol" do
        before(:each) do
          @player = Player.new(:X)
        end

        it "Creates a Player Object" do
          expect(@player).to be_instance_of Player
        end

        it "Sets player letter to symbol" do
          expect(@player.letter).to be_instance_of Symbol
        end

        it "Sets player letter to input" do
          expect(@player.letter).to eql(:X)
        end
      end

      context "when input is string/char" do
        before(:each) do
          @player = Player.new("X")
        end

        it "Creates a Player Object" do
          expect(@player).to be_instance_of Player
        end

        it "Sets player letter to symbol" do
          expect(@player.letter).to be_instance_of Symbol
        end

        it "Sets player letter to input" do
          expect(@player.letter).to eql(:X)
        end
      end

      context "When input is lower case" do
        it "sets player.letter to uppercase" do
          player = Player.new(:x)
          expect(player.letter).to eql(:X)

          player2 = Player.new("x")
          expect(player2.letter).to eql(:X)
        end
      end

      context "When letter is already being used by other Player" do
        before(:each) do
          @player1 = Player.new(:X)
        end

        context "when given lower case" do
          it "raises Standard Error" do
            expect {Player.new("x")}.to raise_error(StandardError, "Letter already in use")
          end
        end

        context "when given upper case" do
          it "raises StandardError" do
            expect{Player.new(:X)}.to raise_error(StandardError, "Letter already in use")
          end
        end
      end
    end

    context "when given incorrect input" do
      context "when given no input" do
        it "raises Argument Error" do
          expect {Player.new}.to raise_error(ArgumentError, "Requires character input")
        end
      end

      context "When given invalid type" do
        it "raises Argument Error" do
          expect{Player.new(5)}.to raise_error(ArgumentError, "Input must be String or Symbol")
          expect{Player.new(Array(1..10))}.to raise_error(ArgumentError, "Input must be String or Symbol")
        end
      end

      context "When given incorrect length or String or Symbol" do
        it "raises ArgumentError" do
          expect{Player.new("Input")}.to raise_error(ArgumentError, "Input must be only 1 character")

          expect{Player.new(:character)}.to raise_error(ArgumentError, "Input must be only 1 character")
        end
      end
    end
  end

  describe "#turn" do
    before(:each) do
      @player = Player.new(:O)
    end
  end
end