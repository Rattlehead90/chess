# frozen_string_literal: false

# a parent class for different pieces. Stores an icon, all possible relative
# moves that describe it's behaviour, a player to whom it belongs and it's position.
class Piece
  def initialize(player)
    @player = player
  end
end
