# frozen_string_literal: false
require_relative '../piece'

# a class depicting knight's behaviour
class Knight < Piece
  attr_reader :icon, :player

  def initialize(player)
    super(player)
    @icon = '♘' if @player == 'white'
    @icon = '♞' if @player == 'black'
  end
end
