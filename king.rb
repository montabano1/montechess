require_relative 'piece.rb'
require_relative 'king_moves.rb'

class King < Piece
  include KingMoves
  def initialize(color, board, pos)
    super(color, board, pos)
    @value = :K
  end

end
