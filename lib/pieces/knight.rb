# frozen_string_literal: false
require_relative '../piece'

# a class depicting knight's behaviour
class Knight < Piece
  attr_reader :icon, :player, :rm_all

  def initialize(player)
    super(player)
    @icon = '♘' if @player == 'white'
    @icon = '♞' if @player == 'black'
    @rm_all = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
  end

  def relative_moves
    @rm_all
  end
end
