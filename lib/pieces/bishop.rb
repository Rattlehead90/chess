# frozen_string_literal: false

require_relative '../piece'

# a class depicting bishop's behaviour
class Bishop < Piece
  attr_reader :icon, :player, :rm_all

  def initialize(player)
    super(player)
    @icon = '♗' if @player == 'white'
    @icon = '♝' if @player == 'black'
    @rm_all = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
               [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6],
               [-7, -7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6],
               [7, -7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6],
               [-7, 7]]
  end

  def relative_moves
    @rm_all
  end
end
