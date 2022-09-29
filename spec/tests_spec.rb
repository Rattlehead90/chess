# frozen_string_literal: false

require_relative '../lib/board'
require_relative '../lib/square'
require_relative '../lib/pieces/rook'
require_relative '../lib/game'

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

describe Game do
  describe '#validate_input' do
    subject(:game) { described_class.new }

    context 'when the player enters a non-existant square' do 
      before do
        non_existant_square = 'e9'
        valid_square = 'e2'
        allow(game).to receive(:player_start_input).and_return(non_existant_square, valid_square)
      end

      it 'throws an an error' do
        expect(game).to receive(:puts).with('Invalid input!').once
        game.player_start_square_turn
      end
    end
  end
end