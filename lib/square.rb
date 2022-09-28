# frozen_string_literal: false

require 'colorize'

# simulates a square as a vertex in a board graph
class Square
  attr_accessor :name, :piece, :color

  def initialize(name, piece = nil, color = nil)
    @name = name
    @piece = piece
    @color = color
  end

  def display_square
    print_piece = @piece ? @piece.icon : ' '
    if @color == 'white'
      print " #{print_piece} ".on_light_green
    else
      print " #{print_piece} ".on_green
    end
  end
end
