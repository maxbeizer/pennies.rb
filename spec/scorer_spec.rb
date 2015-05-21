require_relative '../lib/scorer'
require_relative '../lib/pennies'
require 'pry'

RSpec.describe Scorer do
  describe "::score_move" do
    context "1 penny" do
      it "returns a score of one as one is the only move" do
        one_penny = Pennies.new 1
        expect(Scorer.score_move(one_penny, 1)).to eq 1
      end
    end

    context "2 pennies" do
      let(:two_penny) { Pennies.new 2 }

      context "and one is played" do
        it "returns a score of negative one" do
          expect(Scorer.score_move(two_penny, 1)).to eq(-1)
        end
      end

      context "and two is played" do
        it "returns a score of one" do
          expect(Scorer.score_move(two_penny, 2)).to eq 1
        end
      end
    end
  end

  describe "::best_move_and_score" do
    context "1 penny" do
      let(:one_penny) { Pennies.new 1 }
      let(:scorer) { Scorer.best_move_and_score(one_penny) }

      it "returns an object with a move value of 1" do
        expect(scorer[:move]).to eq 1
      end

      it "returns an object with a score value of 1" do
        expect(scorer[:score]).to eq 1
      end
    end

    context "2 pennies" do
      let(:two_penny) { Pennies.new 2 }
      let(:scorer) { Scorer.best_move_and_score(two_penny) }

      it "returns an object with a move value of 2" do
        expect(scorer[:move]).to eq 2
      end

      it "returns an object with a score value of 1" do
        expect(scorer[:score]).to eq 1
      end
    end

    context "3 pennies" do
      let(:three_penny) { Pennies.new 3 }
      let(:scorer) { Scorer.best_move_and_score(three_penny) }

      it "returns an object with a move value of 3" do
        expect(scorer[:move]).to eq 3
      end

      it "returns an object with a score value of 1" do
        expect(scorer[:score]).to eq 1
      end
    end

    context "4 pennies" do
      let(:four_penny) { Pennies.new 4 }
      let(:scorer) { Scorer.best_move_and_score(four_penny) }

      it "returns an object with a move value of 1" do
        expect(scorer[:move]).to eq 1
      end

      it "returns an object with a score value of -1" do
        expect(scorer[:score]).to eq(-1)
      end
    end
  end
end
