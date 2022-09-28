# frozen_string_literal: false
require_relative '../lib/board'

# a class to implement classic chess rules
class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def player_input
    
  end
end

test = Game.new()
test.board.display