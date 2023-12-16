# frozen_string_literal: true

class BagOfCubes
  CUBE_COUNTS = {
    red: 12,
    green: 13,
    blue: 14
  }.freeze

  def initialize(input)
    @games = input.split("\n")
  end

  def sum_of_valid_games
    game_sum = 0
    @games.each do |game|
      colon_index = game.index(':')
      game_number = game[5..colon_index - 1].to_i
      game_results = game[colon_index + 1..]
      game_sum += game_number if valid_game?(game_results)
    end

    game_sum
  end

  def valid_game?(game_results)
    rounds = game_results.split('; ')
    rounds.each do |round|
      return false unless valid_round?(round)
    end

    true
  end

  def valid_round?(round)
    cubes_drawn = round.split(', ')
    cubes_drawn.each do |cubes|
      n_cubes, color = cubes.split(' ')
      return false if n_cubes.to_i > CUBE_COUNTS[color.to_sym]
    end

    true
  end
end
