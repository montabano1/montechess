require_relative 'sliding_piece.rb'
require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece
  def initialize(color, board, pos)
    super(color, board, pos)
    @value = :R
    @type = [:straight]
  end

end
