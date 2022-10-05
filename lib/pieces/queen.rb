# frozen_string_literal: false
require_relative '../piece'

# a class depicting queen's behaviour
class Queen < Piece
  attr_reader :icon, :player, :rm_all, :rm_vertical, :rm_horizontal, 
              :rm_bend_sinister, :rm_bend

  def initialize(player)
    super(player)
    @icon = '♕' if @player == 'white'
    @icon = '♛' if @player == 'black'
    @rm_vertical = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
                    [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]
    @rm_horizontal = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
                      [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]
    @rm_bend_sinister = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7],
                         [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5],
                         [-6, -6], [-7, -7]]
    @rm_bend = [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7],
                [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
    @rm_all = @rm_vertical + @rm_horizontal + @rm_bend_sinister + @rm_bend
  end

  def relative_moves
    @rm_all
  end
end
