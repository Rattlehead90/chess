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
  attr_accessor :board_hash

  def initialize
    @board_hash = {}
    @horizontal_nomenclature = %w[a b c d e f g h]
    @vertical_nomenclature = %w[1 2 3 4 5 6 7 8]
    create_square_notation
    place_pieces
  end

  def create_square_notation
    @horizontal_nomenclature.each do |file|
      @vertical_nomenclature.each do |rank|
        name = file + rank
        @board_hash[name] = Square.new(name)
      end
    end
  end

  def display
    
  end
end