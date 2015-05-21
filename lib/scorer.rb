require 'pry'

module Scorer
  def self.score_move(game, move)
    after = game.apply_move move
    return after.score_finished_game if after.available_moves.empty?
    reply = Scorer.best_move_and_score after
    -reply[:score]
  end

  def self.best_move_and_score(game)
    best = { move: nil, score: -1_000_000 }
    moves = game.available_moves
    moves.each do |mv|
      score = Scorer.score_move game, mv
      if score > best[:score]
        best[:move]  = mv
        best[:score] = score
      end
    end
    best
  end
end
