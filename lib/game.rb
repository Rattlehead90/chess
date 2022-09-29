# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/player'

# a class that obtains and valorizes a player input
class Game
  attr_accessor :board
  attr_reader :white, :black

  def initialize
    @board = Board.new
    @white = Player.new('white', active: true)
    @black = Player.new('black')
  end

  def player_start_input
    puts "\nType in the name (label) of the starting square of your move: "
    gets.chomp
  end

  def player_end_input
    puts "\nNow the target square of your move: "
    gets.chomp
  end

  def validate_input(square_name)
    return square_name if square_name.match?(/^[a-h][1-8]$/)
  end

  def legal_move?(square_name)
    current_player =
      if white.active
        white
      else
        black
      end
    board.name_hash[square_name].piece.player == current_player.color
  end

  def player_start_square_turn
    loop do
      start_square = validate_input(player_start_input)
      return start_square if start_square && legal_move?(start_square)

      puts 'Invalid input!'
    end
  end

  def player_end_square_turn
    loop do
      end_square = validate_input(player_end_input)
      return end_square if end_square

      puts 'Invalid input!'
    end
  end

  def switch_turns
    white.turn
    black.turn
  end

  # okay now to find a way to set a game_loop which would be able to switch 
  # the turns and find a way to properly (not only syntacticly validate the 
  # input).

  def player_turn
    loop do
      system 'clear'
      board.display
      start_square = player_start_square_turn
      # possible_moves_list = possible_moves(start_square)
      end_square = player_end_square_turn
      # possible_moves_list.include?(end_square)
      board.move_piece(start_square, end_square)
      switch_turns
    end
  end

  # what we need to validate:
  #   - if the square has a piece that corresponds to a player whose turn it is
  #   - there is a piece on a start square
  #   - end square should be one of the possible moves for a piece
  #   - the move should not lead to a check
end

test_game = Game.new
test_game.player_turn