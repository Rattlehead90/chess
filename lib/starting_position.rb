# frozen_string_literal: false

# part of the game initialization. Placing the pieces on starting squares.
module StartingPosition
  def place_rooks
    @board_hash['a1'].piece = Rook.new('white')
    @board_hash['h1'].piece = Rook.new('white')
    @board_hash['a8'].piece = Rook.new('black')
    @board_hash['h8'].piece = Rook.new('black')
  end

  def place_knights
    @board_hash['b1'].piece = Knight.new('white')
    @board_hash['g1'].piece = Knight.new('white')
    @board_hash['b8'].piece = Knight.new('black')
    @board_hash['g8'].piece = Knight.new('black')
  end

  def place_bishops
    @board_hash['c1'].piece = Bishop.new('white')
    @board_hash['f1'].piece = Bishop.new('white')
    @board_hash['c8'].piece = Bishop.new('black')
    @board_hash['f8'].piece = Bishop.new('black')
  end

  def place_kings
    @board_hash['e1'].piece = King.new('white')
    @board_hash['e8'].piece = King.new('black')
  end

  def place_queens
    @board_hash['d1'].piece = Queen.new('white')
    @board_hash['d8'].piece = Queen.new('black')
  end

  def place_pawns
    second_rank = @board_hash.keys.select { |square| square.include?('2') }
    seventh_rank = @board_hash.keys.select { |square| square.include?('7') }
    second_rank.each { |square| @board_hash[square].piece = Pawn.new('white') }
    seventh_rank.each { |square| @board_hash[square].piece = Pawn.new('black') }
  end

  def place_pieces
    place_rooks
    place_knights
    place_bishops
    place_kings
    place_queens
    place_pawns
  end
end
