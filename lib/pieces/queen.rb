# frozen_string_literal: false
require_relative '../piece'

# a class depicting queen's behaviour
class Queen < Piece
  attr_reader :icon, :player

  def initialize(player)
    super(player)
    @icon = '♕' if @player == 'white'
    @icon = '♛' if @player == 'black'
  end
end
