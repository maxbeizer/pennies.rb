require_relative 'pennies'
require_relative 'scorer'
require 'pry'

class Game
  attr_accessor :current_game,
                :winner

  def initialize(num_pennies)
    @current_game = Pennies.new num_pennies
  end

  def play!
    return_the_winner if winner
    play_human_turn
    return_the_winner if winner
    play_computer_turn
    self.play!
  end

  private
  def return_the_winner
    puts "\n\n\nThe winner is: #{winner}"
    exit
  end

  def play_human_turn
    input = collect_input
    return invalid_input unless input_valid? input

    self.current_game = annotate_game(self.current_game.apply_move(input), 'human')
  end

  def play_computer_turn
    move = Scorer.best_move_and_score(current_game)[:move]
    puts "Computer moves #{move}"
    self.current_game = annotate_game(self.current_game.apply_move(move), 'computer')
  end

  def collect_input
    puts 'Your move'
    STDIN.gets.strip.to_i
  end

  def input_valid?(input)
    Array(1..3).include?(input) && input <= current_game.number_of_pennies
  end

  def invalid_input
    puts 'Your move is invalid; please input 1, 2, or 3'
    play!
  end

  def annotate_game(game, last_player)
    puts "number of pennies left: #{game.number_of_pennies}"
    return game if game.available_moves.any?

    self.winner = last_player
  end
end
