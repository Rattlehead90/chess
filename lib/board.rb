# frozen_string_literal: false

require_relative '../lib/square'
require_relative '../lib/piece'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/pawn'
# stores squares in a board_hash, performs meta-functions of a graph
class Board
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

  def place_pieces # consider rewriting with case
    # rooks
    @board_hash['a1'].piece,
    @board_hash['h1'].piece = Rook.new('white')
    @board_hash['a8'].piece,
    @board_hash['h8'].piece = Rook.new('black')

    # knights 
    @board_hash['b1'].piece,
    @board_hash['g1'].piece = Knight.new('white')
    @board_hash['b1'].piece,
    @board_hash['b8'].piece = Knight.new('black')

    # bishops
    @board_hash['c1'].piece,
    @board_hash['f1'].piece = Bishop.new('white')
    @board_hash['c8'].piece,
    @board_hash['f8'].piece = Bishop.new('black')

    # kings
    @board_hash['e1'].piece = King.new('white')
    @board_hash['e8'].piece = King.new('black')

    # queens 
    @board_hash['d1'].piece = Queen.new('white')
    @board_hash['d8'].piece = Queen.new('black')

    # pawns
    second_rank = @board_hash.keys.select { |square| square.include?('2') }
    seventh_rank = @board_hash.keys.select { |square| square.include?('7') }
    second_rank.each { |square| @board_hash[square].piece = Pawn.new('white') }
    seventh_rank.each { |square| @board_hash[square].piece = Pawn.new('black') }
  end

  # def display
    
  # end
end
