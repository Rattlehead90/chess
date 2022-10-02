# frozen_string_literal: false

require_relative '../lib/square'
require_relative '../lib/piece'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/pawn'
require_relative '../lib/starting_position'

require 'pry-byebug'

# stores squares in a name_hash, performs meta-functions of a graph
class Board
  include StartingPosition
  attr_accessor :name_hash, :coordinate_hash, :captured_pieces

  def initialize
    @name_hash = {}
    @coordinate_hash = {}
    @horizontal_nomenclature = %w[a b c d e f g h]
    @vertical_nomenclature = %w[1 2 3 4 5 6 7 8]
    @captured_pieces = []
    create_notation
    place_pieces
  end

  def display
    print_board
    print_horizontal_nomenclature
    print_captured_pieces
  end

  def move_piece(start_square, end_square)
    if @name_hash[end_square].piece.nil?
      move_piece_on_free_square(start_square, end_square) 
    else
      capture_piece(start_square, end_square)
    end
  end

  private

  def print_horizontal_nomenclature
    print '   '
    @horizontal_nomenclature.each { |letter| print "#{letter}  " }
    puts
  end

  def print_board
    @vertical_nomenclature.reverse.each do |rank|
      print "#{rank} "
      @horizontal_nomenclature.each_index do |file_i|
        @coordinate_hash[[file_i, rank.to_i - 1]].display_square
      end
      puts
    end
  end

  def print_captured_pieces
    @captured_pieces.each { |icon| print "#{icon} " }
  end

  def capture_piece(start_square, end_square)
    @captured_pieces << @name_hash[end_square].piece.icon
    @name_hash[end_square].piece = nil
    move_piece_on_free_square(start_square, end_square)
  end

  def move_piece_on_free_square(start_square, end_square)
    @name_hash[start_square].piece, @name_hash[end_square].piece =
      @name_hash[end_square].piece, @name_hash[start_square].piece
  end

  def create_notation
    @horizontal_nomenclature.each_with_index do |file, file_index|
      @vertical_nomenclature.each_with_index do |rank, rank_index|
        name = file + rank
        coordinate = [file_index, rank_index]
        square = Square.new(name)
        @name_hash[name] = square
        assign_square_color(name, rank, file)
        @coordinate_hash[coordinate] = square
      end
    end
  end

  def assign_square_color(name, rank, file)
    square = @name_hash[name]
    square.color = 
      if %w[a c e g].include?(file)
        rank.to_i.odd? ? 'black' : 'white'
      else
        rank.to_i.odd? ? 'white' : 'black'
      end
  end
end
