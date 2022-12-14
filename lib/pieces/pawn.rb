# frozen_string_literal: false

require_relative '../piece'

# a class depicting pawn's behaviour
class Pawn < Piece
  attr_accessor :moved
  attr_reader :icon, :player, :rm_all, :rm_vertical, :rm_horizontal, 
              :rm_bend_sinister, :rm_bend

  def initialize(player)
    super(player)
    @icon = '♙' if @player == 'white'
    @icon = '♟' if @player == 'black'
    @moved = false
    @rm_vertical = [[0, 1], [0, 2]]
    @rm_horizontal = []
    @rm_bend = []
    @rm_bend_sinister = []
    @rm_all = @rm_vertical + @rm_horizontal + @rm_bend_sinister + @rm_bend
    @rm_all.map! { |sub| sub.map(&:-@) } if @player == 'black'
  end

  # The piece should contain the logic of its behaviour:
  #   v possible moves
  #   - possible attacks

  def relative_moves
    rm = @moved ? [@rm_all[0]] : @rm_all
    @moved = true
    rm
  end
end
