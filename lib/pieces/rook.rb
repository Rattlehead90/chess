# frozen_string_literal: false

require_relative '../piece'

# a class depicting rook's behaviour
class Rook < Piece
  attr_reader :icon, :player, :rm_all, :rm_vertical, :rm_horizontal,
              :rm_bend_sinister, :rm_bend

  def initialize(player)
    super(player)
    @icon = '♖' if @player == 'white'
    @icon = '♜' if @player == 'black'
    @rm_vertical = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                    [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
    @rm_horizontal = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
                      [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
    @rm_bend = []
    @rm_bend_sinister = []
    @rm_all = @rm_vertical + @rm_horizontal
  end

  def relative_moves
    @rm_all
  end
end
