# frozen_string_literal: false

# a class to activate or deactivate the player in Game class. Also it stores
# the pieces that that particular player has captured. Lastly it allows to
# check if a player picks up his piece or the one of his opponent's.
class Player
  attr_reader :color
  attr_accessor :active

  def initialize(color = nil, active: false)
    @color = color
    @active = active
    @captured_pieces = []
  end

  def turn
    @active = !@active
  end
end
