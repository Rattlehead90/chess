# frozen_string_literal: false

# simulates a square as a vertex in a board graph
class Square
  attr_accessor :name, :piece, :color

  # fuck i forgot to add the color

  def initialize(name, piece = nil, color = nil)
    @name = name
    @piece = piece
    @color = color
  end
end
