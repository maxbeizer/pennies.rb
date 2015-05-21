require_relative '../lib/pennies'

RSpec.describe Pennies do
  describe "#game_over?" do
    context "when number of pennies is zero" do
      it "returns true" do
        expect(Pennies.new(0).game_over?).to be_truthy
      end
    end

    context "when number of pennies is greater than zero" do
      it "returns false" do
        expect(Pennies.new(1).game_over?).to be_falsey
      end
    end
  end

  describe "#output_game_state" do
    context "there is more than one penny left" do
      it "returns the plural with the number of pennies" do
        expect(Pennies.new(2).output_game_state).to eq 'There are 2 pennies left.'
      end
    end

    context "there is only one penny left" do
      it "returns the singular with the number of pennies" do
        expect(Pennies.new(1).output_game_state).to eq 'There is only one penny left.'
      end
    end
  end

  describe "#apply_move" do
    it "returns a new instance of Pennies with the current pennies minus the move" do
      subject = Pennies.new(2).apply_move(1)
      expect(subject).to be_instance_of Pennies
      expect(subject.output_game_state).to eq 'There is only one penny left.'
    end
  end

  describe "#available_moves" do
    describe "returns an array of possible moves" do
      context "when 3 is not an option" do
        it "returns only 1 and 2 in an array" do
          expect(Pennies.new(2).available_moves).to eq [1, 2]
        end
      end

      context "when 3 and 2 are not options" do
        it "returns only 1 in an array" do
          expect(Pennies.new(1).available_moves).to eq [1]
        end
      end
    end
  end

  describe "#score_finished_game" do
    it "returns 1" do
      expect(Pennies.new(1).score_finished_game).to eq 1
    end
  end
end
