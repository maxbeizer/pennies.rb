class Pennies
  attr_reader :number_of_pennies

  def initialize(number_of_pennies)
    @number_of_pennies = number_of_pennies
  end

  def game_over?
    number_of_pennies == 0
  end

  def output_game_state
    if number_of_pennies > 1
      "There are #{number_of_pennies} pennies left."
    else
      'There is only one penny left.'
    end
  end

  def apply_move(move)
    Pennies.new(number_of_pennies - move)
  end

  def available_moves
    Array(1..3).select { |move| move <= number_of_pennies }
  end

  def score_finished_game
    1
  end
end
