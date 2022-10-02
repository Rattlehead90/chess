# frozen_string_literal: false
require_relative '../piece'

# a class depicting king's behaviour
class King < Piece
  attr_reader :icon, :player, :rm_all

  def initialize(player)
    super(player)
    @icon = '♔' if @player == 'white'
    @icon = '♚' if @player == 'black'
    @rm_all = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def relative_moves
    @rm_all
  end
end
