# frozen_string_literal: false

# simulates a square as a vertex in a board graph
class Square
  attr_accessor :name, :piece

  def initialize(name, piece = nil)
    @name = name
    @piece = piece
  end
end
