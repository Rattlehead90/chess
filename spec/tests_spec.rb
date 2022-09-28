# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/square'
require_relative '../lib/pieces/rook'

describe Board do 
  describe '#move_piece' do
    subject(:board) { described_class.new }

    context 'when the player moves the piece' do
      before do
        board.move_piece('e2', 'e4')
      end

      it 'removes the piece from the original square' do
        piece_on_original_square = board.name_hash['e2'].piece
        expect(piece_on_original_square).to be_nil
      end

      it 'places the piece on the new chosen square' do
        piece_on_new_square = board.name_hash['e4'].piece
        expect(piece_on_new_square).not_to be_nil
      end
    end
  end
end