# frozen_string_literal: false

require_relative '../piece'

# a class depicting rook's behaviour
class Rook < Piece
  attr_reader :icon, :player, :rm_all

  def initialize(player)
    super(player)
    @icon = '♖' if @player == 'white'
    @icon = '♜' if @player == 'black'
    @rm_all = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [0, -1],
               [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [1, 0],
               [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [-1, 0], [-2, 0],
               [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
  end

  def relative_moves
    @rm_all
  end
end
