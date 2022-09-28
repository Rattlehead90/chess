# frozen_string_literal: false

# part of the game initialization. Placing the pieces on starting squares.
module StartingPosition
  def place_rooks
    @name_hash['a1'].piece = Rook.new('white')
    @name_hash['h1'].piece = Rook.new('white')
    @name_hash['a8'].piece = Rook.new('black')
    @name_hash['h8'].piece = Rook.new('black')
  end

  def place_knights
    @name_hash['b1'].piece = Knight.new('white')
    @name_hash['g1'].piece = Knight.new('white')
    @name_hash['b8'].piece = Knight.new('black')
    @name_hash['g8'].piece = Knight.new('black')
  end

  def place_bishops
    @name_hash['c1'].piece = Bishop.new('white')
    @name_hash['f1'].piece = Bishop.new('white')
    @name_hash['c8'].piece = Bishop.new('black')
    @name_hash['f8'].piece = Bishop.new('black')
  end

  def place_kings
    @name_hash['e1'].piece = King.new('white')
    @name_hash['e8'].piece = King.new('black')
  end

  def place_queens
    @name_hash['d1'].piece = Queen.new('white')
    @name_hash['d8'].piece = Queen.new('black')
  end

  def place_pawns
    second_rank = @name_hash.keys.select { |square| square.include?('2') }
    seventh_rank = @name_hash.keys.select { |square| square.include?('7') }
    second_rank.each { |square| @name_hash[square].piece = Pawn.new('white') }
    seventh_rank.each { |square| @name_hash[square].piece = Pawn.new('black') }
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
