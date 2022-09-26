# frozen_string_literal: false

require 'colorize'
require_relative '../lib/square'
require_relative '../lib/piece'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/pawn'
require_relative '../lib/starting_position'

# stores squares in a board_hash, performs meta-functions of a graph
class Board
  include StartingPosition
  attr_accessor :board_hash, :coordinate_hash

  def initialize
    @board_hash = {}
    @coordinate_hash = {}
    @horizontal_nomenclature = %w[a b c d e f g h]
    @vertical_nomenclature = %w[1 2 3 4 5 6 7 8]
    create_notation
    place_pieces
  end

  def create_notation
    @horizontal_nomenclature.each_with_index do |file, file_index|
      @vertical_nomenclature.each_with_index do |rank, rank_index|
        name = file + rank
        coordinate = [file_index, rank_index]
        square = Square.new(name)
        @board_hash[name] = square
        assign_square_color(name, rank, file)
        @coordinate_hash[coordinate] = square
      end
    end
  end

  def assign_square_color(name, rank, file)
    square = @board_hash[name]
    square.color = 
      if %w[a c e g].include?(file)
        rank.to_i.odd? ? 'black' : 'white'
      else
        rank.to_i.odd? ? 'white' : 'black'
      end
  end

  def display 
    # Before you do that. Now you need to implement the second version of 
    # nomenclature, a.k.a. coordinate system. It should help you with pieces'
    # logic and with the display function, as you could address each rank
    # separetely. 
  end
end
