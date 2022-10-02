# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/player'
require 'pry-byebug'

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
    return false if board.name_hash[square_name].piece.nil?

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

  def player_end_square_turn(start_square)
    loop do
      end_square = validate_input(player_end_input)
      es_coordinates = board.coordinate_hash.key(board.name_hash[end_square])
      return end_square if end_square &&
                           possible_moves(start_square).include?(es_coordinates)

      puts 'Invalid input!'
      reset_pawn(start_square)
    end
  end

  def reset_pawn(square)
    if (board.name_hash[square].piece.instance_of? Pawn) &&
       square.match?(/^[a-h]7$/)
      board.name_hash[square].piece.moved = false
    end
  end

  def switch_turns
    white.turn
    black.turn
  end

  def possible_moves(square_name)
    start_square = board.name_hash[square_name]
    relative_moves = start_square.piece.relative_moves
    start_coordinates = board.coordinate_hash.key(start_square)
    get_absolute_moves(relative_moves, start_coordinates)
  end

  def get_absolute_moves(relative_moves, start_coordinates)
    absolute_moves = []
    relative_moves.each do |move_direction|
      x = (move_direction[0] + start_coordinates[0])
      y = (move_direction[1] + start_coordinates[1])
      absolute_moves.append([x, y]) if board.coordinate_hash.keys.include?([x, y])
    end
    absolute_moves
  end

  def player_turn
    loop do
      system 'clear'
      board.display
      start_square = player_start_square_turn
      end_square = player_end_square_turn(start_square)
      board.move_piece(start_square, end_square)
      switch_turns
    end
  end

  # what we need to validate:
  #   v if the square has a piece that corresponds to a player whose turn it is
  #   v there is a piece on a start square
  #   v end square should be one of the possible moves for a piece
  #   - the move should not lead to a check
end

test_game = Game.new
test_game.player_turn
